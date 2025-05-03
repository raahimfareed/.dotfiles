#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

#define MAX_FILENAME_LENGTH 256
#define BUFFER_SIZE 1024

#define DIRECTORY "."

void read_files()
{
    printf("A asd");
    DIR *dir;
    struct dirent *entry;
    printf("B ");

    char filename[MAX_FILENAME_LENGTH] = "";
    char buffer[BUFFER_SIZE];
    printf("C ");
    if ((dir = opendir(DIRECTORY)) != NULL)
    {
        while ((entry = readdir(dir)) != NULL)
        {
            if (entry->d_type == DT_REG && strstr(entry->d_name, ".usp") != NULL)
            {
                printf("%s\t", entry->d_name);
                printf("We're in\n");
                strcat(filename, DIRECTORY);
                strcat(filename, "/");
                strcat(filename, entry->d_name);
                printf("Filename copied: %s\n", filename);
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

                printf("Contents of the file %s:\n%s\n", entry->d_name, buffer);

                close(file_fd);
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
    read_files();
    return 0;
}
