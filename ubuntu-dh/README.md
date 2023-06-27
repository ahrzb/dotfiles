### Setup

* Install nix using [nix-installer](https://github.com/DeterminateSystems/nix-installer)
* Run `nix run .#activate`

### Add secrets

Put these configs in `~/.secrets` and fill it out
```bash
export DRONE_SERVER=
export DRONE_TOKEN=
export DH_AWS_ECR_ROOT=
export SAML2AWS_SESSION_DURATION=43200
export SAML2AWS_PASSWORD=
export SAML2AWS_USERNAME=
export CLOUDFLARE_EMAIL=
export CLOUDFLARE_API_KEY=
export GITHUB_TOKEN=
export LOKI_ADDR=
```

### Other useful setup work

```bash
helm repo add deliveryhero https://charts.deliveryhero.io/
```
