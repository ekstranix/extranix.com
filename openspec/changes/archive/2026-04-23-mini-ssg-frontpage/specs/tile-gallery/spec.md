## ADDED Requirements

### Requirement: Tile-based grid layout
The page SHALL display services as a responsive grid of clickable tiles, with 3 columns on desktop and fewer on smaller screens.

#### Scenario: Desktop layout
- **WHEN** the page is viewed on a screen wider than 768px
- **THEN** tiles SHALL be displayed in a grid of up to 3 columns

#### Scenario: Mobile layout
- **WHEN** the page is viewed on a screen narrower than 768px
- **THEN** tiles SHALL stack vertically or display in fewer columns

### Requirement: Tile content shows short label and description
Each tile SHALL display the service's `short` field as a large, bold typographic element and the `description` field as smaller text below it.

#### Scenario: Tile displays content
- **WHEN** a tile is rendered for a service
- **THEN** it SHALL show the `short` value prominently and the `description` value as secondary text

### Requirement: Tiles are clickable links
Each tile SHALL be a clickable element that navigates to the service's `url`.

#### Scenario: Tile click navigates
- **WHEN** a user clicks a tile
- **THEN** the browser SHALL navigate to the service's `url`

### Requirement: NixOS rainbow palette colors assigned by position
Tiles SHALL be styled with colors from the NixOS rainbow palette, automatically assigned based on tile position using CSS nth-child selectors, cycling through the palette.

#### Scenario: Color assignment
- **WHEN** 7 tiles are displayed
- **THEN** each tile SHALL have a distinct color from the NixOS rainbow palette, with the 7th tile cycling back to the first color

### Requirement: System-following dark and light mode
The page SHALL support both dark and light color schemes, switching automatically based on the user's OS preference via CSS `prefers-color-scheme`.

#### Scenario: Dark mode
- **WHEN** the user's OS is set to dark mode
- **THEN** the page SHALL render with a dark background and light text, with rainbow colors used as tile accents

#### Scenario: Light mode
- **WHEN** the user's OS is set to light mode
- **THEN** the page SHALL render with a light background and dark text, with rainbow colors used as tile accents
