# yaml-driven-build Specification

## Purpose
TBD - created by archiving change mini-ssg-frontpage. Update Purpose after archive.
## Requirements
### Requirement: YAML data file defines all page content
The `sites.yaml` file SHALL contain all content for the frontpage: site title, tagline, disclaimer text, and a list of services with name, short label, URL, and description fields.

#### Scenario: Valid sites.yaml structure
- **WHEN** sites.yaml is read by the build command
- **THEN** it SHALL contain a `site` object with `title`, `tagline`, and `disclaimer` fields, and a `services` array where each entry has `name`, `short`, `url`, and `description` fields

### Requirement: Build command generates index.html from YAML
The `./RUNME.sh build` command SHALL read `sites.yaml` using `yq`, generate HTML for each service as a tile element, and write the complete page to `index.html`.

#### Scenario: Successful build
- **WHEN** the user runs `./RUNME.sh build` with a valid `sites.yaml`
- **THEN** `index.html` SHALL be written to the repo root containing the site title, tagline, one tile per service, the disclaimer, and the Umami analytics script

#### Scenario: Adding a new service
- **WHEN** a new entry is added to the `services` array in `sites.yaml` and `./RUNME.sh build` is run
- **THEN** `index.html` SHALL contain a new tile for that service without any other file changes

### Requirement: Generated HTML references external CSS and JS
The generated `index.html` SHALL link to `style.css` and `main.js` as external files, not inline styles or scripts.

#### Scenario: External asset references
- **WHEN** `index.html` is generated
- **THEN** the HTML head SHALL contain a `<link>` to `style.css` and a `<script>` tag referencing `main.js`

### Requirement: Umami analytics preserved
The generated `index.html` SHALL include the existing Umami analytics script tag.

#### Scenario: Analytics script present
- **WHEN** `index.html` is generated
- **THEN** the HTML head SHALL contain the Umami script tag with `data-website-id="ee0c5e4c-1817-44ac-8b05-cdceaf5da358"`

