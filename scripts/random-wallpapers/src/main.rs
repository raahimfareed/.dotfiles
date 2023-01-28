use std::thread::sleep;
use std::time::Duration;
use std::process::Command;

use std::fs;

use rand::prelude::*;

fn main() {
    let time: u64 = 10 * 60;
    let wallpapers = "/home/yeet/Pictures/wallpapers";
    let dir = fs::read_dir(wallpapers);

    match dir {
        Ok(_) => (),
        Err(error) => {
            println!("An error occurred, Error: {}", error);
            println!("Current directory: {wallpapers}");
            return;
        }
    };

    let mut files: Vec<fs::DirEntry> = Vec::new();

    for file in dir.unwrap() {
        files.push(file.unwrap());
    }

    loop {
        let file = files.choose(&mut thread_rng()).unwrap();

        let output = Command::new("feh")
            .args(vec!["--bg-fill", file.path().to_str().unwrap()])
            .output()
            .expect("Could not run feh");
        println!("Output: {:?}", output);
        sleep(Duration::from_secs(time));
    }
}
