#!/bin/bash

# A script to initialize a new laravel project and serve it

path=$1

if [[ -z "$path" ]]; then
	path="."
fi

echo "Creating a New Laravel Project at $path"
composer create-project laravel/laravel $path

if [[ $? -ne 0 ]]; then
	echo "An error occurred while creating a project with composer!"
	exit 1
fi

echo "Project created!"

cd $path

echo "Running npm install"
npm i
if [[ $? -ne 0 ]]; then
	echo "npm install failed"
	exit 1
fi

echo "Running npm dev"
npm run dev &
if [[ $? -ne 0 ]]; then
	echo "npm run dev failed"
	exit 1
fi
code .
php artisan serve

