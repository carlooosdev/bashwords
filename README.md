# Bashwords

This is a simple password manager script written in bash. It allows users to add, get, delete, and list passwords for different accounts or services. The passwords are encrypted using the AES-256 encryption algorithm and stored in separate files.

## Usage

To use the password manager script, you can run it with different command-line options. 

```bash
./main.sh [options]
```

### Options

- **-a, --add**: Add a new password for an account/service.
- **-g, --get**: Get the password for a specified account/service.
- **-d, --delete**: Delete the password for a specified account/service.
- **-l, --list**: List all the passwords for all accounts/services.
- **-h, --help**: Show the help message with usage instructions.

## File Structure

The script uses the following files:

- **data/passwords/**: A directory that stores the encrypted password files for each account/service.
- **data/key.passman**: A file that contains the encryption key used for encrypting and decrypting passwords.

## Functions

The script includes the following functions:

- **usage()**: Displays the usage instructions and options.
- **encrypt()**: Encrypts a password using the AES-256 encryption algorithm.
- **decrypt()**: Decrypts an encrypted password using the AES-256 encryption algorithm.
- **add_password()**: Prompts the user to enter an account/service name and password, encrypts the password, and stores it in a password file.
- **get_password()**: Prompts the user to enter an account/service name and retrieves the encrypted password from the corresponding password file, decrypts it, and displays it.
- **delete_password()**: Prompts the user to enter an account/service name and deletes the corresponding password file if it exists.
- **list_passwords()**: Lists all the account/service names for which passwords are stored.

## Implementation

The script uses a `while` loop to process the command-line options provided by the user. It checks the option and calls the corresponding function accordingly. If an invalid option is provided, it displays an error message and shows the usage instructions.

## Examples

Here are some examples of how to use the script:

- **Adding a Password**: `./main.sh --add`
  Prompts the user to enter an account/service name and password. Encrypts the password and stores it in a corresponding password file.

- **Getting a Password**: `./main.sh --get`
  Prompts the user to enter an account/service name and retrieves the encrypted password from the corresponding password file. Decrypts the password and displays it.

- **Deleting a Password**: `./main.sh --delete`
  Prompts the user to enter an account/service name and deletes the corresponding password file if it exists.

- **Listing Passwords**: `./main.sh --list`
  Lists all the account/service names for which passwords are stored.

## Security Considerations

- Make sure to keep the encryption key (`data/key.passman`) secure and confidential.
- Store the password files (`data/passwords/*.passman`) in a secure location.
- Regularly backup the password files and encryption key to prevent data loss.

Note: This is a simple password manager script and may not provide all the security features and considerations of a professional password manager. Use at your own risk.

For more information on password security, refer to industry best practices and guidelines.
