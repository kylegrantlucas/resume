# resume

Kyle's resume as a single [JSONResume](https://jsonresume.org/) file (`resume.json`), rendered to PDF by [resume-exporter](https://github.com/kylegrantlucas/resume-exporter).

## Layout
- `resume.json`: the source of truth. The site (kylegrantlucas/kylegrantlucas.github.io) fetches it from `main` via raw.githubusercontent.com at build time.
- `justfile`: `just` / `just modern` / `just classic` → `output/kyle_{modern,classic}.pdf` (gitignored); `just open`, `just clean`.
- `.github/workflows/generate-resume.yml`: on every push builds both PDFs (artifact), attaches them to a release on tags, and on `main` sends `repository_dispatch: resume-generated` to kylegrantlucas/kylegrantlucas.github.io so the site rebuilds.

## Dev
- `nix develop` (or direnv): provides `just`, `typst`, and `resume-exporter` built from source of the resume-exporter GitHub repo (flake input `resume-exporter-src`; `nix flake update resume-exporter-src` to pick up a new version). Then `just`.
- Fonts: templates use Avenir Next / Helvetica Neue. They ship with macOS; CI downloads them into `~/.local/share/fonts`. Not provided by Nix.

## Secrets
- `REPO_ACCESS_TOKEN` (Actions secret): fine-grained PAT with **Contents: Read and write** on `kylegrantlucas/kylegrantlucas.github.io` (required by `repository_dispatch`). If dispatch fails with "Bad credentials", the PAT has expired; rotate it.
