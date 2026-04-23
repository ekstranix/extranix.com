## Context

extranix.com is a static single-page site served from a git repo root. It currently has a hand-written `index.html` with inline CSS listing 3 Nix-related subsites. RUNME.sh provides a task-runner framework but only has a demo command. The site will grow to 10+ subsites.

## Goals / Non-Goals

**Goals:**
- Content-presentation separation: YAML data file drives all page content
- Single build command (`./RUNME.sh build`) generates index.html from YAML + heredoc template
- Visual tile gallery with NixOS rainbow palette
- System-following dark/light mode via CSS only
- Flat file structure — no dist/ folder, repo root is the deploy target

**Non-Goals:**
- No watch/serve/live-reload for local development
- No CSS preprocessor or JS bundler
- No manual dark mode toggle (system-only)
- No icon files or images — typography only

## Decisions

### Heredoc template in RUNME.sh (not a separate template file)
The HTML page is small enough that a bash heredoc in the `build` function is simpler than maintaining a separate template file with placeholder substitution. One less file, and the template is right next to the build logic.

**Alternative**: Separate `templates/index.html` with `sed` replacement of `{{TILES}}` placeholder. Rejected because it adds a file and complexity for minimal benefit at this scale.

### yq for YAML parsing
`yq` (go version) is the standard CLI YAML processor, available in nixpkgs. Bash can't parse YAML natively, and yq is the lightest viable dependency.

**Alternative**: Python/Ruby one-liner, custom awk parser. Rejected — yq is idiomatic in the Nix ecosystem.

### Rainbow colors via CSS nth-child (not YAML-assigned)
Colors auto-cycle by tile position using CSS `nth-child` selectors with the NixOS rainbow palette. No `color` field needed in YAML — less to maintain, and the rainbow sequence is the design intent.

**Alternative**: Explicit color field per service in YAML. Rejected — unnecessary maintenance burden. Can be added later if needed.

### CSS prefers-color-scheme only (no JS toggle)
Dark mode follows the OS setting via `@media (prefers-color-scheme: dark)`. No toggle button, no JS, no localStorage. Simplest correct implementation.

## Risks / Trade-offs

- **yq dependency** — Build requires yq installed. Mitigation: document in RUNME.sh, trivial to get via `nix-shell -p yq-go`.
- **Heredoc templating is limited** — If the page grows significantly more complex, the heredoc approach won't scale. Mitigation: sufficient for 10+ tiles on a single page; revisit if multi-page needs arise.
- **Generated index.html committed to git** — Possible for YAML and HTML to drift if someone edits index.html directly. Mitigation: a comment in the generated HTML noting it's auto-generated.
