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