# App component design system

All measurements are points. Base grid: 4. Borders are 1 pt, not physical-pixel hairlines.
Minimum dimensions expand with Dynamic Type and wrapped labels; never impose max heights.

| Role | MyTV / compactMedia | ShowBook / editorial | Motivation Daily / softWellness |
|---|---|---|---|
| Brand core | #2563EB blue | #00064F navy | #B45309 amber |
| Character | dense, precise, media-led | quiet, editorial, reading-led | warm, spacious, reflective |
| Screen horizontal inset | 16 | 20 | 24 |
| Section spacing | 24 | 28 | 32 |
| List/grid item gap | 8 | 12 | 16 |
| Control gap | 8 | 12 | 12 |
| Card padding | 12 | 16 | 20 |
| Card corner radius | 12 | 12 | 20 |
| Button/field corner radius | 10 | 8 | 14 |
| Primary/secondary/field minimum height | 48 | 48 | 52 |
| Button padding vertical/horizontal | 12 / 16 | 12 / 16 | 12 / 16 |
| Standard card/field border | 1 | 1 | 1 |
| Selected border | 2 | 2 | 2 |
| Chip horizontal/vertical padding | 12 / 8 | 12 / 8 | 16 / 8 |
| Chip corner radius | 10 | 8 | 14 |
| Icon artwork | 20–24 | 20–24 | 20–24 |
| Icon-only hit area | 44 minimum | 44 minimum | 44 minimum |
| List row vertical/horizontal padding | 12 / 16 | 16 / 20 | 16 / 24 |
| Modal content inset / radius | 20 / 20 | 24 / 20 | 24 / 28 |

## Component rules

- Buttons: primary uses action/on-action; secondary uses surface/text with a 1 pt border;
  tertiary uses action text without a filled background. Equal priority means equal geometry.
- Text fields: same radius and minimum height as buttons, 16 pt horizontal inset;
  persistent external label, inline error text and 2 pt error/focus border. Never color alone.
- Cards/tiles: preset card padding/radius; 1 pt border; no default shadow. Media crops
  within the card; the entire card must not hide overflowing accessibility text.
- Chips: use preset spacing and control radius; interactive hit areas remain >=44 pt.
- Rows: use list padding above; separate with semantic border; trailing actions keep 44 pt hit areas.
- Banners: use card geometry, icon + title + message; semantic status tint with readable text.
  Status colors must never replace the meaning expressed by icon/text.
- Sheets: native presentation/navigation; use modal inset for custom content. Keep system
  drag indicators and safe areas; do not force corner geometry onto system presentations.
- Typography: system Dynamic Type. Screen title .largeTitle.bold, section .title2.bold,
  card title .headline, body .body, supporting .subheadline, metadata .caption.
  Auth branding can use a larger title but must retain wrapping and scrolling.
- Navigation: native bars and tab bars. Brand action tint; background/surface/text from host assets.
- Motion: short native transitions; honor Reduce Motion. No looping decorative motion by default.
- Dark mode: use lightened action colors with dark on-action text; semantic assets own the switch.

## Ownership and adoption

Apps own brand assets and choose a LayoutPreset. DesignTokensKit owns geometry and
semantic role definitions. UIComponentsKit owns component rendering and interaction.
Feature packages compose them. Provider logos preserve their brand identity.
New ThemedSurface/ThemedButtonStyle opt into ComponentTheme; existing explicit APIs
retain their behaviour. Other components adopt matching metrics through their existing
initializers as screens migrate. This is a design contract, not a completed full-app restyle.
