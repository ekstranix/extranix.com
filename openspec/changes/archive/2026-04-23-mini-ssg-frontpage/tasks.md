## 1. Data Layer

- [x] 1.1 Create `sites.yaml` with site metadata (title, tagline, disclaimer) and 3 current services (name, short, url, description)

## 2. Presentation Layer

- [x] 2.1 Create `style.css` with base typography, tile grid layout (3-col responsive), NixOS rainbow palette via nth-child, and dark/light mode via prefers-color-scheme
- [x] 2.2 Create `main.js` as minimal placeholder

## 3. Build System

- [x] 3.1 Update `RUNME.sh`: remove demo command, add `build` command that reads sites.yaml with yq, generates tile HTML per service, and writes index.html from heredoc template (including external CSS/JS links and Umami analytics script)

## 4. Verification

- [x] 4.1 Run `./RUNME.sh build` and verify generated index.html contains all services as tiles, links style.css and main.js, includes Umami script, and renders correctly in both dark and light mode
