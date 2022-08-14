### Setup

```bash
# Install nix (at the time of writing this is version 2.7.0
curl -L https://nixos.org/nix/install | sh

# Build and boostrap
nix build ./darwin-dh#darwinConfigurations."a.roozbahani".system
./result/sw/bin/darwin-rebuild switch --flake .
```

### Add secrets

Fill out this file and put it in `~/.secrets`
```bash
export DH_AWS_ECR_ROOT='<aws_account_id>.dkr.ecr.<region>.amazonaws.com'
export SAML2AWS_SESSION_DURATION=43200 # 12 Hours
export SAML2AWS_USERNAME='<firstname>.<lastname>@deliveryhero.com'
export SAML2AWS_PASSWORD='<your Keycloak password (not the Okta one)>'
export CLOUDFLARE_EMAIL='<firstname>.<lastname>@deliveryhero.com'
export CLOUDFLARE_API_KEY='<cludflare-global-api-key>'
```

### Other useful setup work

```bash
helm repo add deliveryhero https://charts.deliveryhero.io/
```
