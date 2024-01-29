#!/bin/bash

: <<LICENSE
Copyright 2024 Carlos Henrique

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
LICENSE

PASSWORD_DIR="data/passwords/"
KEY_FILE="data/key.passman"

usage() {
  echo "Usage: ./password_manager.sh [options]"
  echo "Options:"
  echo "  -a, --add        Add a new password"
  echo "  -g, --get        Get a password"
  echo "  -d, --delete     Delete a password"
  echo "  -l, --list       List all passwords"
  echo "  -h, --help       Show help"
}

encrypt() {
  password="$1"
  key=$(cat "$KEY_FILE")
  echo "$password" | openssl enc -aes-256-cbc -a -salt -pass pass:"$key"
}

decrypt() {
  encrypted_password="$1"
  key=$(cat "$KEY_FILE")
  echo "$encrypted_password" | openssl enc -d -aes-256-cbc -a -salt -pass pass:"$key"
}

add_password() {
  echo -n "Enter the account/service name: "
  read -r account
  echo -n "Enter the password: "
  read -s password

  encrypted_password=$(encrypt "$password")
  echo "$encrypted_password" > "$PASSWORD_DIR$account.passman"
  echo "Password added successfully."
}

get_password() {
  echo -n "Enter the account/service name: "
  read -r account

  if [[ -f "$PASSWORD_DIR$account.passman" ]]; then
    encrypted_password=$(cat "$PASSWORD_DIR$account.passman")
    password=$(decrypt "$encrypted_password")
    echo "Password for $account: $password"
  else
    echo "Password not found for $account."
  fi
}

delete_password() {
  echo -n "Enter the account/service name: "
  read -r account

  if [[ -f "$PASSWORD_DIR$account.passman" ]]; then
    rm "$PASSWORD_DIR$account.passman"
    echo "Password deleted successfully for $account."
  else
    echo "Password not found for $account."
  fi
}

list_passwords() {
  if [[ -n "$(ls -A "$PASSWORD_DIR")" ]]; then
    echo "All passwords:"
    for file in "$PASSWORD_DIR"*.passman; do
      account=$(basename "$file" .passman)
      echo "$account"
    done
  else
    echo "No passwords found."
  fi
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -a|--add)
      add_password
      exit
      ;;
    -g|--get)
      get_password
      exit
      ;;
    -d|--delete)
      delete_password
      exit
      ;;
    -l|--list)
      list_passwords
      exit
      ;;
    -h|--help)
      usage
      exit
      ;;
    *)
      echo "Invalid option: $1"
      usage
      exit 1
      ;;
  esac
done

usage
