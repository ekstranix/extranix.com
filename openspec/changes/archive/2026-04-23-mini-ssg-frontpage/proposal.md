## Why

The extranix.com frontpage is a hand-maintained index.html listing subsites. With 3 services now and 10+ expected, maintaining raw HTML becomes tedious and error-prone. Separating content (YAML) from presentation (CSS/JS/HTML template) makes adding new subsites trivial — just add a YAML entry and rebuild.

## What Changes

- Migrate page content (site metadata + service listings) from index.html into a `sites.yaml` data file
- Add a `build` command to RUNME.sh that reads YAML and generates index.html via heredoc template
- Extract inline CSS to a separate `style.css` with a tile-based grid layout, NixOS rainbow color palette, and system-following dark mode
- Add a `main.js` file (minimal placeholder for future interactivity)
- Redesign the page from a plain list to a visual tile gallery of subsites

## Capabilities

### New Capabilities
- `yaml-driven-build`: RUNME.sh build command that reads sites.yaml and generates index.html using yq and bash heredoc templating
- `tile-gallery`: Responsive tile grid with NixOS rainbow palette colors auto-assigned by position, system-following dark/light mode via prefers-color-scheme

### Modified Capabilities

(none — this is a new project structure, no existing specs)

## Impact

- **Files created**: `sites.yaml`, `style.css`, `main.js`
- **Files modified**: `RUNME.sh` (replace demo command with build command), `index.html` (now generated, not hand-written)
- **Dependencies**: `yq` CLI tool (available via nix-shell/nixpkgs)
- **Deployment**: No change — repo root is still served directly. index.html is generated locally and committed.
