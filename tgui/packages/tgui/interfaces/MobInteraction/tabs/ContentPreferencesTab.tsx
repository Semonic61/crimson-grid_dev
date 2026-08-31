// THIS IS AN RMH UI FILE
import { Button, LabeledList, Section } from 'tgui-core/components';

import { useBackend } from '../../../backend';

type Prefs = {
  content_prefs: {
    erp_pref: boolean;
    erp_sounds_pref: boolean;
    erp_autocum_pref: boolean;
    erp_status: string;
  };
};

export const ContentPreferencesTab = () => {
  const { act, data } = useBackend<Prefs>();
  const prefs = data.content_prefs || {
    erp_pref: false,
    erp_sounds_pref: true,
    erp_autocum_pref: true,
    erp_status: 'Ask',
  };

  return (
    <Section fill>
      <LabeledList>
        <LabeledList.Item label="ERP master">
          <Button
            icon={prefs.erp_pref ? 'check' : 'times'}
            color={prefs.erp_pref ? 'good' : 'bad'}
            onClick={() => act('pref', { pref: 'erp_pref' })}
          >
            {prefs.erp_pref ? 'Enabled' : 'Disabled'}
          </Button>
        </LabeledList.Item>
        <LabeledList.Item label="ERP sounds">
          <Button
            icon={prefs.erp_sounds_pref ? 'volume-up' : 'volume-mute'}
            onClick={() => act('pref', { pref: 'erp_sounds_pref' })}
          >
            {prefs.erp_sounds_pref ? 'On' : 'Off'}
          </Button>
        </LabeledList.Item>
        <LabeledList.Item label="Auto climax">
          <Button
            icon={prefs.erp_autocum_pref ? 'check' : 'times'}
            onClick={() => act('pref', { pref: 'erp_autocum_pref' })}
          >
            {prefs.erp_autocum_pref ? 'On' : 'Off'}
          </Button>
        </LabeledList.Item>
        <LabeledList.Item label="ERP status">{prefs.erp_status}</LabeledList.Item>
      </LabeledList>
    </Section>
  );
};
