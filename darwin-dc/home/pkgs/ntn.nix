# Notion's official CLI (beta). Not in nixpkgs; this is the upstream release binary that
# `curl https://ntn.dev | bash` installs. `ntn update` can't write to the Nix store:
# bump `version` and `hash` by hand (latest: https://ntn.dev/latest.txt).
{
  lib,
  stdenvNoCC,
  fetchurl,
  installShellFiles,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "ntn";
  version = "0.23.29";

  src = fetchurl {
    url = "https://ntn.dev/releases/v${finalAttrs.version}/ntn-aarch64-apple-darwin.tar.gz";
    hash = "sha256-+g7zPqnQhw4t568sS8nWMqaKmaqXGqFdXLr4nz6mseU=";
  };

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    runHook preInstall
    install -Dm755 ntn $out/bin/ntn
    runHook postInstall
  '';

  postInstall = ''
    export HOME=$TMPDIR
    installShellCompletion --cmd ntn \
      --bash <($out/bin/ntn completions bash) \
      --zsh <($out/bin/ntn completions zsh) \
      --fish <($out/bin/ntn completions fish)
  '';

  meta = {
    description = "Notion CLI: pages, data sources, the API, and Notion Workers";
    homepage = "https://developers.notion.com/cli";
    license = lib.licenses.mit;
    mainProgram = "ntn";
    platforms = [ "aarch64-darwin" ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
  };
})
