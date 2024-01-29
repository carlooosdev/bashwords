# Bashwords Script - System Requirements

To run the password manager script successfully, there are a few requirements that need to be met. This document outlines the necessary software and configurations needed on your system.

## System Compatibility

The password manager script is developed primarily for Unix-like systems such as Linux and macOS. While it may work on other platforms, the following requirements are specifically tailored for Unix-like systems.

## Prerequisites

Ensure that the following software packages are installed on your system:

- **Bash**: The password manager script is written in Bash, so a compatible Bash shell is necessary. Most Unix-like systems come with Bash pre-installed. To check the installed version, open a terminal and run the command:
  ```bash
  bash --version
  ```

- **OpenSSL**: The script utilizes OpenSSL for AES-256 encryption. Make sure OpenSSL is installed on your system. To check the installed version, run the command:
  ```bash
  openssl version
  ```

If any of the required software is missing or outdated, please install or update them to meet the minimum version requirements.

## File Permissions

Ensure that you have read, write, and execute permissions in the directory where the password manager script is located. The script needs these permissions to create and modify the necessary files.

Additionally, if you plan to run the script using elevated privileges (e.g., as a system administrator), make sure you have the appropriate permissions to access and modify the system files and components the script interacts with.

## Configuration

The password manager script relies on the presence of specific directories and files. Please ensure the following configurations:

- **Data Directory**: The `data/` directory should be present in the same location as the password manager script. This directory stores encrypted password files, the encryption key, and other necessary data.

- **Passwords Directory**: Inside the `data/` directory, create a subdirectory named `passwords/`. This directory will hold the encrypted password files for each account or service.

- **Encryption Key**: Create a file named `key.passman` inside the `data/` directory. This file should contain the encryption key for the password files. Make sure to keep this key secure and confidential.

## Usage

For detailed instructions on how to use the password manager script and its available command-line options, please refer to the main README file.

By fulfilling these requirements and configurations, you should be able to run the password manager script smoothly and securely on your system.
