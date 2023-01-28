#! /usr/bin/env python

import time
import subprocess
import random
import os

wallpapers_directory = "/home/yeet/Pictures/wallpapers/"


def set_random_wallpaper(directory):
    files = os.listdir(directory)
    wallpaper = random.choice(files)
    wallpaper_path = os.path.join(directory, wallpaper)
    subprocess.run(["feh", "--bg-fill", wallpaper_path])


while True:
    set_random_wallpaper(wallpapers_directory)
    time.sleep(10 * 60)
