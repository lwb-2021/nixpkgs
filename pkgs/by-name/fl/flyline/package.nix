{
  fetchFromGitHub,

  rustPlatform,

  nix-update-script,

  lib,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "flyline";
  version = "1.3.0";
  src = fetchFromGitHub {
    owner = "HalFrgrd";
    repo = "flyline";
    tag = "v${finalAttrs.version}";
    hash = "sha256-KciBcUsoMCGuw8bHlVBDHAB55lDfyeGoJxBldmj0MVs=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "ansi-to-tui-7.0.0" = "sha256-yjFMApRil913Z2omlMNeSjQPUD/uhxSq1Li16Rci1Xs=";
      "crossterm-0.29.0" = "sha256-6s8Hg49oqZxcNbPI2HqWbxlR0Qsmn/1l5eOWp3cAi44=";
      "flash-0.0.6" = "sha256-hWMyaP1dELpeiB5lVBUD9kzXg3zOVlSd1EbI3ynjqzw=";
      "flycomp-1.1.0" = "sha256-6RDHZxEjXcaKyd2GqPwXhzhKP4HPx63bWBgsW6H8YG0=";
      "ratatui-0.30.0-beta.0" = "sha256-G100nZTaeFeq1UrZ+hQK2aggWO3yyhmWkvzUSJUr0+g=";
      "skim-4.6.0" = "sha256-cUSiXwEWUDZccbl3sts2DG4ZNzYExD9ra/VESv2u+Zs=";
    };
  };

  passthru.updateScript = nix-update-script {
  };

  meta = with lib; {
    description = "Flyline: a Bash plugin to replace readline for a modern line editing experience: syntax highlighting, agent integration, rich prompts, tooltips, fuzzy history search, and more!";
    homepage = "https://github.com/HalFrgrd/flyline";
    license = licenses.gpl3;
    maintainers = [ ];
  };
})
