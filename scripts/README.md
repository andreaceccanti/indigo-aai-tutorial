# How to use this scripts

1.  Define an env file with client credentials and IAM endpoint.
    Example:
    ```bash
      export IAM_HOSTNAME="https://wlcg.cloud.cnaf.infn.it"
      export IAM_CLIENT_ID="andrea.example"
      export IAM_CLIENT_SECRET="XXX"
    ```
2. Source the env and config files:
   ```bash
    source .env.wlcg
    source config.sh
    ```
3. Get a token:
   ```bash
   IAM_CLIENT_SCOPES="openid storage.read:/" ./dc-get-access-token.sh
   ```
