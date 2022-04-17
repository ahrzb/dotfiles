source "$HOME/.secrets"
source "$HOME/.aliases"

export SAML2AWS_SESSION_DURATION=43200
export GOOGLE_APPLICATION_CREDENTIALS="${HOME}/.config/gcloud/legacy_credentials/amirhossein.roozbahani@deliveryhero.com/adc.json"
export EDITOR=vim
export KUBECONFIG=/dev/null
export AIRFLOW_BUSINESS_UNIT="log"

export ARGO_SERVER='argo-workflows.syslogistics.io:443'
export ARGO_HTTP1=true
export ARGO_SECURE=true
export ARGO_BASE_HREF=/
export ARGO_NAMESPACE=argo-workflows

source $(brew --prefix antigen)/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle command-not-found
antigen bundle zsh-interactive-cd
antigen bundle fzf
antigen bundle git
antigen bundle aws
antigen bundle pip
antigen bundle brew
antigen bundle python
antigen bundle golang
antigen bundle rust
antigen bundle emacs
antigen bundle vscode
antigen bundle iterm2
antigen bundle vagrant
antigen bundle docker
antigen bundle docker-compose
antigen bundle kubectl
antigen bundle z

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle changyuheng/fz
antigen bundle ptavares/zsh-direnv
antigen bundle starship/starship

# Tell Antigen that you're done.
antigen apply

source ~/.opam/opam-init/init.zsh
eval "$(starship init zsh)"
eval "$(argo completion zsh)"

source /Users/temporaryadmin/.config/broot/launcher/bash/br
