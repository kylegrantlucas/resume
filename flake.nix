{
  description = "Kyle's resume (JSONResume) + PDF build via resume-exporter";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Built from source here so this works regardless of whether resume-exporter has its own flake.
    resume-exporter-src = {
      url = "github:kylegrantlucas/resume-exporter";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, resume-exporter-src }:
    let
      systems = [ "aarch64-darwin" "x86_64-linux" "aarch64-linux" ];
      forAll = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAll (pkgs:
        let
          resume-exporter = pkgs.rustPlatform.buildRustPackage {
            pname = "resume-exporter";
            version = (builtins.fromTOML (builtins.readFile "${resume-exporter-src}/Cargo.toml")).package.version;
            src = resume-exporter-src;
            cargoLock.lockFile = "${resume-exporter-src}/Cargo.lock";
          };
        in
        {
          # Fonts: templates use Avenir Next / Helvetica Neue (macOS system fonts; CI downloads them
          # into ~/.local/share/fonts). resume-exporter only scans system font dirs, so nothing to add here.
          default = pkgs.mkShell {
            packages = [ pkgs.just resume-exporter pkgs.typst ];
          };
        });
    };
}
