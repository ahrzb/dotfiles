# granted's `assume` for nushell, ported from its assume.fish.
# assumego prints `<flag> <field1> ... <field12>` on stdout; prompts go to stderr.
def --env assume [...args] {
  let output = (with-env { GRANTED_ALIAS_CONFIGURED: "true" } { ^assumego ...$args })
  let lines = ($output | lines)
  if ($lines | is-empty) { return }
  let fields = ($lines | first | str trim | split row ' ')
  let field = {|i| $fields | get -o $i | default "None" }
  let granted_vars = [
    AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_PROFILE
    AWS_REGION AWS_DEFAULT_REGION AWS_SESSION_EXPIRATION AWS_CREDENTIAL_EXPIRATION
    GRANTED_SSO GRANTED_SSO_START_URL GRANTED_SSO_ROLE_NAME GRANTED_SSO_REGION GRANTED_SSO_ACCOUNT_ID
  ]

  match ($fields | first) {
    "NAME:" => { ^assumego ...$args }
    "GrantedDesume" => { hide-env -i ...$granted_vars }
    "GrantedAssume" => {
      hide-env -i ...$granted_vars
      [
        [AWS_ACCESS_KEY_ID 1] [AWS_SECRET_ACCESS_KEY 2] [AWS_SESSION_TOKEN 3] [AWS_PROFILE 4]
        [AWS_REGION 5] [AWS_DEFAULT_REGION 5]
        [AWS_SESSION_EXPIRATION 6] [AWS_CREDENTIAL_EXPIRATION 6]
        [GRANTED_SSO 7] [GRANTED_SSO_START_URL 8] [GRANTED_SSO_ROLE_NAME 9]
        [GRANTED_SSO_REGION 10] [GRANTED_SSO_ACCOUNT_ID 11]
      ]
      | where {|pair| (do $field $pair.1) != "None" }
      | each {|pair| { $pair.0: (do $field $pair.1) } }
      | reduce -f {} {|it, acc| $acc | merge $it }
      | load-env
      $env.GRANTED_COMMAND = ($args | str join ' ')
    }
    "GrantedOutput" => { $lines | where {|line| $line != "GrantedOutput" } | each { print $in } | ignore }
    "GrantedExec" => {
      with-env {
        AWS_ACCESS_KEY_ID: (do $field 1)
        AWS_SECRET_ACCESS_KEY: (do $field 2)
        AWS_SESSION_TOKEN: (do $field 3)
        AWS_REGION: (do $field 5)
        AWS_DEFAULT_REGION: (do $field 5)
      } { ^sh -c ($fields | skip 12 | str join ' ') }
    }
  }
}
