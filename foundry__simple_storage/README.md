## How to store private keys in keystore

> source
> https://ethereum.stackexchange.com/questions/158784/how-to-encrypt-the-private-key-in-a-keystore-file-in-foundry

### 1. Create a new keystore

```bash
cast wallet import <account_name> --interactive # name can be any name you like
```

### 2. List all keystores

```bash
cast wallet list
```

### 3. use keystore

```bash
forge script <script> --rpc-url <rpc_url> --broadcast --account <account_name> --password <password>
# more secure
forge script <script> --rpc-url <rpc_url> --broadcast --account <account_name> # it will prompt you to enter password
```

### For help

```bash
cast wallet --help
```
