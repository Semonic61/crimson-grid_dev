https://github.com/Semonic61/crimson-grid_dev/tree/panel

## RMH ERP panel

Module ID: RMH_ERP

### Description:

Self-contained ERP stack for the `panel` branch: genital organs on the TG 2025
visual-organ system, character-editor preferences, MobInteraction TGUI,
climax + fluid transfer, and hand/oral/sex/self interactions.

Ported and adapted from WhiteMoon-Station (SPLURT / Skyrat lineage) to this
SecondCity / crimson-grid fork. No vore, no Plug13, no sex-toy catalogue.

Folder name is `modular_rmh` on purpose (not `modular_erp`).

### TG Proc/File Changes:

- `tgstation.dme` — include list only (see `dme_fragment.txt`)
- `tgui/packages/tgui/interfaces/MobInteraction/*` — new interface (`// THIS IS AN RMH UI FILE`)
- `tgui/packages/tgui/interfaces/PreferencesMenu/preferences/features/character_preferences/rmh_erp.tsx` — new feature file
- `code/__DEFINES/~rmh/erp.dm` — late-loading defines (after `~darkpack`, before `~~crimson_defines`)

### Modular Overrides:

- `modular_rmh/code/accessories_hook.dm`: `/datum/controller/subsystem/accessories/setup_lists`
- `modular_rmh/code/species_hook.dm`: `/datum/species/human/New`
- `modular_rmh/code/living.dm`: `/mob/living` vars + Initialize
- `modular_rmh/code/examine.dm`: `/mob/living/carbon/human/examine`

### Defines:

- `code/__DEFINES/~rmh/erp.dm`

### Config:

- `/datum/config_entry/flag/erp_content` — defaults off
- Helper: `erp_content_enabled()`
- Enable in `config/config.txt` with `ERP_CONTENT` when you want it live

### Assets (not in git yet):

Icons and sounds live under `modular_rmh/icons/` and `modular_rmh/sounds/`.
They must be committed from the local asset zip (GitHub file API is text-only).

### Credits:

WhiteMoon-Station / BlueMoon-Labs, Skyrat, SPLURT, /tg/station, DarkPack13 SecondCity
