## Context

The extranix.com frontpage was just converted from hand-written HTML to a YAML-driven SSG. The current design is functional but visually generic — white background, small tiles, no branding. It needs to feel like a Nix community project, not a parked domain.

The existing NixOS rainbow palette colors are already defined in CSS variables. The build system (RUNME.sh + yq + heredoc) is in place.

## Goals / Non-Goals

**Goals:**
- Give the site a distinctive Nix identity through a lambda-based logo
- Make the rainbow palette more prominent and intentional
- Create a design that feels best in dark mode but works well in light mode too
- Make tiles feel like real interactive elements, not a bulleted list in boxes

**Non-Goals:**
- No external fonts (system font stack only)
- No images or icon files — SVG inline only
- No JavaScript for visual effects
- No redesign of the build system — only template and CSS changes

## Decisions

### Inline SVG lambda logo in the heredoc template
The lambda logo is an SVG element embedded directly in the HTML template heredoc in RUNME.sh. It uses a `<linearGradient>` with the six NixOS rainbow colors to fill the lambda text. This keeps everything self-contained — no external files to serve or cache.

**Alternative**: CSS-styled `λ` character with `background-clip: text` gradient. Rejected because browser support for `background-clip: text` on special characters is inconsistent, and SVG gives precise control over the gradient stops.

### Single lambda, not a snowflake arrangement
A single large `λ` with rainbow gradient is cleaner and more recognizable at any size than trying to arrange six lambdas into a snowflake pattern. The snowflake idea is clever but would be hard to read at small sizes and complex to maintain as SVG.

### Rainbow gradient bar as CSS pseudo-element
The rainbow bar between header and tiles is a CSS `::after` pseudo-element on the header with a `linear-gradient` background. No extra HTML elements needed.

### Tile backgrounds use rainbow color at low opacity
Each tile gets its rainbow color as a background tint (the color at ~8-12% opacity) rather than just a top border. This gives more visual weight and color presence. The `--tile-color` CSS variable is already set per nth-child; the background uses it with `color-mix()` or rgba equivalent.

### Tinted page background instead of pure white/black
Light mode uses a slightly warm off-white (#f8f8fa). Dark mode uses a deep blue-black (#0d1117, similar to GitHub dark) rather than the current #1a1a2e. This feels more intentional and less "default".

### Wordmark typography: "Extra" light + "Nix" bold
The h1 splits into two `<span>` elements: "Extra" in font-weight 300 and "Nix" in font-weight 800. This creates visual hierarchy within the name and emphasizes the "Nix" part.

## Risks / Trade-offs

- **SVG in heredoc increases template complexity** → The SVG is static and small (~15 lines), manageable within the heredoc.
- **color-mix() CSS support** → Supported in all modern browsers since 2023. For older browsers, fallback to the solid `--bg-tile` color is acceptable.
- **Dark-first design may feel odd if user is in light mode** → Light mode is still fully designed, just not the "hero" version. Both modes should look good.
