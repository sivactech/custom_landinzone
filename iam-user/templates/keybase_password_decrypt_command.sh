echo "${encrypted_password}" | base64 --decode | /usr/local/bin/gpg --decrypt
