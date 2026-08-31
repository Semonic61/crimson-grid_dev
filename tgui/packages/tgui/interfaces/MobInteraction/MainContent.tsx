// THIS IS AN RMH UI FILE
import { useState } from 'react';
import { Input, Section, Stack, Tabs } from 'tgui-core/components';

import { ContentPreferencesTab } from './tabs/ContentPreferencesTab';
import { GenitalTab } from './tabs/GenitalTab';
import { InteractionsTab } from './tabs/InteractionsTab';

export const MainContent = () => {
  const [searchText, setSearchText] = useState('');
  const [tabIndex, setTabIndex] = useState(0);

  return (
    <Section fill>
      <Stack vertical fill>
        <Stack.Item>
          <Tabs fluid textAlign="center">
            <Tabs.Tab selected={tabIndex === 0} onClick={() => setTabIndex(0)}>
              Interactions
            </Tabs.Tab>
            <Tabs.Tab selected={tabIndex === 1} onClick={() => setTabIndex(1)}>
              Genital Options
            </Tabs.Tab>
            <Tabs.Tab selected={tabIndex === 2} onClick={() => setTabIndex(2)}>
              Content Prefs
            </Tabs.Tab>
          </Tabs>
        </Stack.Item>
        <Stack.Item>
          <Input
            fluid
            placeholder={
              tabIndex === 0
                ? 'Search for an interaction'
                : tabIndex === 1
                  ? 'Search for a genital'
                  : 'Search'
            }
            onChange={(value) => setSearchText(value)}
          />
        </Stack.Item>
        <Stack.Item grow basis={0}>
          {tabIndex === 0 && <InteractionsTab searchText={searchText} />}
          {tabIndex === 1 && <GenitalTab searchText={searchText} />}
          {tabIndex === 2 && <ContentPreferencesTab />}
        </Stack.Item>
      </Stack>
    </Section>
  );
};
