# Datadog's official CLI. Not in nixpkgs (nixpkgs' `pup` is an unrelated HTML parser);
# this is the upstream release binary. Bump `version` and `hash` by hand.
{
  lib,
  stdenvNoCC,
  fetchurl,
  installShellFiles,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "pup";
  version = "2.4.5";

  src = fetchurl {
    url = "https://github.com/DataDog/pup/releases/download/v${finalAttrs.version}/pup_${finalAttrs.version}_Darwin_arm64.tar.gz";
    hash = "sha256-1rqc5VGpUggiNYbc8XqtKlhM7trruk+bWc2/OV+i9QM=";
  };
  # The archive has no top-level directory.
  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    runHook preInstall
    install -Dm755 pup $out/bin/pup
    runHook postInstall
  '';

  postInstall = ''
    export HOME=$TMPDIR
    installShellCompletion --cmd pup \
      --bash <($out/bin/pup completions bash) \
      --zsh <($out/bin/pup completions zsh) \
      --fish <($out/bin/pup completions fish)
  '';

  meta = {
    description = "Datadog CLI (logs, metrics, monitors, dashboards, incidents, …)";
    homepage = "https://github.com/DataDog/pup";
    license = lib.licenses.asl20;
    mainProgram = "pup";
    platforms = [ "aarch64-darwin" ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
  };
})
