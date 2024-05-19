#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/wait.h>

#define MAX_FILENAME_LENGTH 256
#define BUFFER_SIZE 1024
#define NUM_CHILDREN 4 // Number of child processes to create

#define DIRECTORY "./resources"

void read_files(int pipe_fd)
{
    DIR *dir;
    struct dirent *entry;

    char filename[MAX_FILENAME_LENGTH] = "";
    char buffer[BUFFER_SIZE];

    if ((dir = opendir(DIRECTORY)) != NULL)
    {
        while ((entry = readdir(dir)) != NULL)
        {
            if (entry->d_type == DT_REG && strstr(entry->d_name, ".usp") != NULL)
            {
                strcat(filename, DIRECTORY);
                strcat(filename, "/");
                strcat(filename, entry->d_name);
                int file_fd = open(filename, O_RDONLY);
                if (file_fd == -1)
                {
                    perror("Unable to open file");
                    filename[0] = '\0';
                    continue;
                }

                ssize_t bytes_read = read(file_fd, buffer, BUFFER_SIZE);
                if (bytes_read == -1)
                {
                    perror("Error reading from file");
                    close(file_fd);
                    filename[0] = '\0';
                    continue;
                }

                buffer[bytes_read] = '\0';

                close(file_fd);

                // Write filename to parent process
                write(pipe_fd, entry->d_name, strlen(entry->d_name) + 1);
            }

            filename[0] = '\0';
        }
        closedir(dir);
    }
    else
    {
        perror("Unable to open directory");
        exit(EXIT_FAILURE);
    }
}

int main()
{
    int pipe_fds[NUM_CHILDREN][2];                     // Array of pipes for communication with child processes
    pid_t child_pids[NUM_CHILDREN];                    // Array to store child process IDs
    char filenames[NUM_CHILDREN][MAX_FILENAME_LENGTH]; // Array to store filenames received from child processes

    // Create pipes
    for (int i = 0; i < NUM_CHILDREN; i++)
    {
        if (pipe(pipe_fds[i]) == -1)
        {
            perror("Pipe creation failed");
            exit(EXIT_FAILURE);
        }
    }

    // Create child processes
    for (int i = 0; i < NUM_CHILDREN; i++)
    {
        pid_t pid = fork();
        if (pid == -1)
        {
            perror("Fork failed");
            exit(EXIT_FAILURE);
        }
        else if (pid == 0) // Child process
        {
            // Close write end of pipe
            close(pipe_fds[i][1]);

            // Read filenames from parent and process them
            read_files(pipe_fds[i][0]);

            // Close read end of pipe
            close(pipe_fds[i][0]);

            exit(EXIT_SUCCESS);
        }
        else // Parent process
        {
            // Close read end of pipe
            close(pipe_fds[i][0]);

            child_pids[i] = pid;
        }
    }

    // Parent process reads filenames from child processes
    for (int i = 0; i < NUM_CHILDREN; i++)
    {
        // Sleep for 1 to 2 seconds for child processes to complete processing
        sleep(1 + (rand() % 2));

        // Read filenames from child
        char filename[MAX_FILENAME_LENGTH];
        ssize_t bytes_read = read(pipe_fds[i][1], filename, MAX_FILENAME_LENGTH);
        if (bytes_read == -1)
        {
            perror("Error reading from pipe");
            exit(EXIT_FAILURE);
        }

        // Store filename in array
        strncpy(filenames[i], filename, bytes_read);

        // Close write end of pipe
        close(pipe_fds[i][1]);
    }

    // Wait for all child processes to finish
    for (int i = 0; i < NUM_CHILDREN; i++)
    {
        waitpid(child_pids[i], NULL, 0);
    }

    // Print filenames received from child processes
    printf("Filenames received from child processes:\n");
    for (int i = 0; i < NUM_CHILDREN; i++)
    {
        printf("%s\n", filenames[i]);
    }

    return 0;
}
