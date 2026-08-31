// THIS IS AN RMH UI FILE
import {
  CheckboxInput,
  type Feature,
  FeatureNumberInput,
  type FeatureNumeric,
  FeatureToggle,
} from '../base';
import { FeatureDropdownInput } from '../dropdowns';

export const erp_pref: FeatureToggle = {
  name: 'Enable ERP',
  category: 'GAMEPLAY',
  description: 'Master toggle. Required to use the interaction panel.',
  component: CheckboxInput,
};

export const erp_sounds_pref: FeatureToggle = {
  name: 'ERP Sounds',
  category: 'GAMEPLAY',
  description: 'Play interaction sounds.',
  component: CheckboxInput,
};

export const erp_autocum_pref: FeatureToggle = {
  name: 'ERP Auto Climax',
  category: 'GAMEPLAY',
  description: 'Climax automatically at max pleasure.',
  component: CheckboxInput,
};

export const erp_status: Feature<string> = {
  name: 'ERP Status',
  description: 'Shown to other players as your ERP willingness.',
  component: FeatureDropdownInput,
};

export const feature_penis: Feature<string> = {
  name: 'Penis',
  description: 'Character genital. None removes the organ.',
  component: FeatureDropdownInput,
};

export const feature_testicles: Feature<string> = {
  name: 'Testicles',
  component: FeatureDropdownInput,
};

export const feature_vagina: Feature<string> = {
  name: 'Vagina',
  component: FeatureDropdownInput,
};

export const feature_breasts: Feature<string> = {
  name: 'Breasts',
  component: FeatureDropdownInput,
};

export const feature_anus: Feature<string> = {
  name: 'Anus',
  component: FeatureDropdownInput,
};

export const penis_size: FeatureNumeric = {
  name: 'Penis Size',
  component: FeatureNumberInput,
};

export const testicles_size: FeatureNumeric = {
  name: 'Testicles Size',
  component: FeatureNumberInput,
};

export const breasts_size: FeatureNumeric = {
  name: 'Breasts Size',
  component: FeatureNumberInput,
};
