# OpenResty IAM integration example

This folder contains a dockerized NGINX that showcases integration with 
an OpenID Connect provider.

## Building the docker image

```console
docker build -t openresty-rp-example .
```

## Running the docker image

The OpenID Connect relying party is configured via environment variables
provided to the container.

Defaults for INDIGO IAM test integration are provided in the image, and 
a suitable configuration is listed below:

```bash
# The client identifier
OID_CLIENT_ID=your_client_id
# The client secret
OID_CLIENT_SECRET=your_client_secret
# The client local redirect path (does not include the hostname)
OID_REDIRECT_PATH=/redirect-uri 
# The OP discovery endpoint
OID_DISCOVERY=https://iam-test.indigo-datacloud.eu/.well-known/openid-configuration 
# The OP introspection endpoint (used when acting as resource server)
OID_INTROSPECTION_ENDPOINT=https://iam-test.indigo-datacloud.eu/introspect 
```
You can define the environment variables in an envfile and pass it
to docker via the `env-file` option:

```console
docker run --env-file envfile --hostname rp.local.io --name openresty-rp -p 80:80 openresty-rp-example
```

This will run a nginx on plain http (port 80) on rp.local.io.

## Checking client integration

A request to the root context, i.e. http://rp.local.io, will trigger an OpenID
Connect authentication flow. If authentication is succesful, NGINX will display
the authentication information returned by the OpenID Connect provider.

## Checking the resource server integration

A request to the /api context, i.e. http://rp.local.io/api will trigger an
OAuth token introspection flow. If the token validation is succesfull, NGINX
will display the information returned by the token introspection endpoint.

To test this behaviour, you will first need to get a token (for instance by
copy pasting what is diplayed in the steps discussed above) and the include it
in an HTTP request to the /api endpoint. Assuming the token is contained in the
IAM_ACCESS_TOKEN environment variable, the following command will test the
resource server integration (this command uses [httpie][httpie] command line
utility):

```console

```

[httpie]: https://github.com/jakubroztocil/httpie

