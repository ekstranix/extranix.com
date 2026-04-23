## ADDED Requirements

### Requirement: Rainbow gradient bar below header
A thin horizontal bar with a linear gradient through all six NixOS rainbow colors SHALL appear between the header and the tile grid.

#### Scenario: Gradient bar visible
- **WHEN** the page is rendered
- **THEN** a gradient bar (4-6px tall) cycling through red, orange, yellow, green, blue, purple SHALL be visible below the header

### Requirement: Tiles have colored background tint
Each tile SHALL have a background color derived from its assigned rainbow color at low opacity (~10%), in addition to the colored top border.

#### Scenario: Tile background in dark mode
- **WHEN** a tile is rendered in dark mode
- **THEN** the tile background SHALL show a subtle tint of its assigned rainbow color

#### Scenario: Tile background in light mode
- **WHEN** a tile is rendered in light mode
- **THEN** the tile background SHALL show a subtle tint of its assigned rainbow color

### Requirement: Tiles are taller with larger typography
Tiles SHALL have increased padding and the `.short` label SHALL be rendered at a larger font size than the current 1.5rem.

#### Scenario: Tile size
- **WHEN** tiles are rendered
- **THEN** tiles SHALL have at minimum 2rem padding and the `.short` label SHALL be at least 1.8rem font size

### Requirement: Tinted page backgrounds
The page background SHALL use a tinted off-white in light mode and a deep blue-black in dark mode, not pure white or generic dark.

#### Scenario: Light mode background
- **WHEN** the page is viewed in light mode
- **THEN** the background SHALL be an off-white tone (not #ffffff)

#### Scenario: Dark mode background
- **WHEN** the page is viewed in dark mode
- **THEN** the background SHALL be a deep blue-black tone

### Requirement: Arrow indicator on tiles
Each tile SHALL display a directional arrow indicator (e.g., `→`) to signal that it is a clickable link.

#### Scenario: Arrow visible
- **WHEN** a tile is rendered
- **THEN** an arrow indicator SHALL be visible within the tile, positioned at the bottom or trailing edge
