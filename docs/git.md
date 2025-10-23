# Git

## Generate GPG key for signing commits

1. Generate a new GPG key pair using the same name and email address as Git:

    ```console
    gpg --quick-generate-key "$(git config user.name) <$(git config user.email)>" rsa4096 sign never
    ```

    At the prompt, enter a strong passphrase and store it somewhere secure, for example a password manager.

1. Refresh your GitHub login to allow adding GPG keys:

    ```console
    gh auth refresh -s write:gpg_key
    ```

1. Add the GPG key to your GitHub account:

    ```console
    gpg -a --export "$(git config user.email)" | gh gpg-key add -t "$(hostname)"
    ```

1. Configure Git to use your signing key:

    ```console
    git config --global user.signingKey "$(git config user.email)"
    ```

1. Configure Git to sign commits using GPG:

    ```console
    git config --global commit.gpgsign true
    ```

The next time you run `git commit`, you'll be prompted to enter your passphrase. Select "Save in password manager" to save your passphrase in GNOME Passwords and Secrets (so you'll never have to enter your passphrase again).

If you ever need to "forget" the saved passphrase, simply delete it in GNOME Passwords and Secrets.

## References

- <https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key>
- <https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits>
