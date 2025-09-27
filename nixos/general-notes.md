General Notes
- Nix Commands
    - Nix Shell
    * `nix-shell -p {package}` - Start a nix shell you can install a specific package and use. The writer used this to install sbctl and create keys for secureboot.
- Secureboot
    - This build has secure boot enabled using Lanzoboote. It works perfectly fine.
- Sops
    - If you setup a .sops.yaml file to define the rules for sops
    - You can encrypt with your age public key and then only decrypt using your private key.
    - Encryption tips
        - You HAVE to encrypt with sops if you want to build a flake
        - Example of how: `sops --encrypt --in-place secrets.yaml `
        - This will change the format of your regular yaml into something sops can actually deal with
    - Yaml tips
        - As you build your secrets.yaml, know that nested properties = nested directores in the run folder
        - Example: 
            - blah
    - Ownership
        - In sops.secrets.specific_secret, you can pass in an owner to specify which users can see the secret without using sudo.
        - You can specify a username as a string or retrieve it from `config.users.users.user.name`
    - Opening a sops file
        - Since the files are encrypted the only way you can really read a sops file is by using the command `sops secrets/secrets.yaml` to see what the secrets actually are.
    