# Service Management Console

**Author:** Kishor Rajbanshi
**Website:** [kishor-rajbanshi.com.np](https://kishor-rajbanshi.com.np)

## Introduction

Welcome to Service Management Console! This console application is designed to help you manage services with ease. You can start, stop, restart, or view the version of specific services using the provided commands and arguments.

## Features

- Start, stop, and restart services effortlessly.
- Manage Nginx, MySQL, and PHP CGI processes.
- Efficiently control various services on your system.

## Prerequisites

Before using the Service Management Console, make sure you have the following prerequisites:

1. **Services Installation**: Ensure that the services (Nginx, MySQL, PHP) are properly installed on your system.

2. **Environment Path**: Add the paths to the service executables to your system's environment variable "Path." This allows the batch script to locate the service executables.

## Installation and Setup

1. **Clone or Download**: Clone this repository or download the `RunHiddenConsole.exe` and `smc.bat` file.

2. **Edit Environment Path**: Open the system's environment variable settings and add the path to navigate to the directory containing the `smc.bat` file.

3. **Run the Script**: Open a command prompt and type `smc`.

## Usage

To use the Service Management Console, follow the command format:

### Available Commands

- **start**: Start a service
- **stop**: Stop a service
- **restart**: Restart a service
- **version**: View the version of the Service Management Console

### Arguments

- **nginx**: Manage the Nginx web server
- **mysql**: Manage the MySQL database server
- **php-cgi**: Manage the PHP CGI process

## Examples

- To start the Nginx server: `smc.bat start nginx`
- To stop the MySQL server: `smc.bat stop mysql`
- To restart the PHP CGI process: `smc.bat restart php-cgi`
- To view the version of the Service Management Console: `smc.bat version`

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
