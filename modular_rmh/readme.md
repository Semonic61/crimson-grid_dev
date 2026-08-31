https://github.com/Semonic61/crimson-grid_dev/tree/panel

## RMH ERP panel

Module ID: RMH_ERP

### Description:

Self-contained ERP stack for the `panel` branch: genital organs on the TG 2025
visual-organ system, character-editor preferences, MobInteraction TGUI,
climax + fluid transfer, and hand-only milking/handjob/fingering.

Ported and adapted from WhiteMoon-Station (SPLURT / Skyrat lineage) to this
SecondCity / crimson-grid fork. No vore, no Plug13, no sex-toy catalogue.

### TG Proc/File Changes:

- `tgstation.dme` — include list only
- `tgui/packages/tgui/interfaces/MobInteraction/*` — new interface
- `tgui/packages/tgui/interfaces/PreferencesMenu/preferences/features/character_preferences/rmh_erp.tsx` — new feature file
- `code/__DEFINES/~rmh/erp.dm` — late-loading defines

### Modular Overrides:

- `modular_rmh/code/accessories_hook.dm`: `/datum/controller/subsystem/accessories/setup_lists`
- `modular_rmh/code/species_hook.dm`: `/datum/species/human/New`
- `modular_rmh/code/living.dm`: `/mob/living` vars + Initialize
- `modular_rmh/code/examine.dm`: `/mob/living/carbon/human/examine`

### Defines:

- `code/__DEFINES/~rmh/erp.dm`

### Credits:

WhiteMoon-Station / BlueMoon-Labs, Skyrat, SPLURT, /tg/station, DarkPack13 SecondCity
