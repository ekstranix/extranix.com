## Why

The current frontpage looks like a parked domain — generic white background, small polite tiles, no visual identity. It needs personality and Nix branding to feel like a community project built with love, not a placeholder.

## What Changes

- Add an inline SVG lambda logo built from `λ` characters arranged in a pattern, with rainbow gradient fill referencing the NixOS rainbow palette
- Restyle the header with a "Extra" (light weight) + "Nix" (bold) wordmark next to the lambda logo
- Add a thin rainbow gradient bar as a visual separator below the header
- Redesign tiles: taller, with rainbow-colored backgrounds at low opacity, larger typography, arrow indicator
- Make dark mode feel like the "primary" design — deeper, richer colors that let the rainbow palette pop
- Improve light mode with tinted background instead of plain white
- Update RUNME.sh heredoc template to include the SVG logo and new HTML structure

## Capabilities

### New Capabilities
- `lambda-logo`: Inline SVG logo composed of lambda symbols with NixOS rainbow gradient fill, embedded in the generated HTML
- `visual-design`: Refined visual design with rainbow gradient bar, tinted backgrounds, bigger tiles with colored backgrounds, and improved typography hierarchy

### Modified Capabilities

(none)

## Impact

- **Files modified**: `style.css` (major rework), `RUNME.sh` (updated HTML template with SVG logo and new structure)
- **Files regenerated**: `index.html` (after rebuild)
- **No new dependencies**
