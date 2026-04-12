#!/bin/bash

DIR="$(cd "$(dirname "$0")" && pwd)"

sudo dnf install -y age git-crypt

until age -d -o /dev/shm/git-crypt-key "$DIR/git-crypt-key.enc"; do
    echo "Decryption failed. Wrong passphrase? Retrying..."
done

git-crypt unlock /dev/shm/git-crypt-key
rm /dev/shm/git-crypt-key
