## 1. CSS Rework

- [x] 1.1 Update `style.css`: change page backgrounds (off-white #f8f8fa for light, deep blue-black #0d1117 for dark), update tile backgrounds to use rainbow color at ~10% opacity via color-mix()
- [x] 1.2 Update `style.css`: increase tile padding to 2rem, increase `.short` font size to 1.8rem+, add arrow indicator (`→`) via `::after` pseudo-element
- [x] 1.3 Add rainbow gradient bar as `header::after` pseudo-element (4-6px, linear-gradient through all six rainbow colors)
- [x] 1.4 Add wordmark styles: `.wordmark-extra` at font-weight 300, `.wordmark-nix` at font-weight 800

## 2. Logo and Template

- [x] 2.1 Update RUNME.sh heredoc: add inline SVG lambda logo with `<linearGradient>` using six rainbow color stops and `<text>` element displaying `λ`
- [x] 2.2 Update RUNME.sh heredoc: restructure header to place logo and wordmark side by side, split title into Extra/Nix spans with CSS classes

## 3. Verification

- [x] 3.1 Run `./RUNME.sh build` and verify: lambda logo renders with rainbow gradient, wordmark has correct weight split, rainbow bar visible, tiles have colored backgrounds and arrows, both dark and light modes look correct
