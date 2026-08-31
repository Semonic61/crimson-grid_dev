// THIS IS AN RMH UI FILE
import { Button, Collapsible, NoticeBox, Section } from 'tgui-core/components';

import { useBackend } from '../../../backend';

type InteractionsInfo = {
  categories: string[];
  interactions: Record<string, string[]>;
  descriptions: Record<string, string>;
  colors: Record<string, string>;
  block_interact: boolean;
};

type Props = { searchText: string };

export const InteractionsTab = ({ searchText }: Props) => {
  const { act, data } = useBackend<InteractionsInfo>();
  const { categories = [], interactions = {}, descriptions = {}, colors = {}, block_interact } = data;
  const query = (searchText || '').toLowerCase();

  if (block_interact) {
    return <NoticeBox>You are too far away.</NoticeBox>;
  }

  return (
    <Section fill scrollable>
      {(categories || []).map((category) => {
        const ids = (interactions[category] || []).filter((id) => {
          const desc = descriptions[id] || '';
          return id.toLowerCase().includes(query) || desc.toLowerCase().includes(query);
        });
        if (!ids.length) {
          return null;
        }
        return (
          <Collapsible key={category} title={category} open>
            {ids.map((id) => (
              <Button
                key={id}
                color={colors[id] || 'blue'}
                tooltip={descriptions[id]}
                onClick={() => act('interact', { interaction: id })}
              >
                {id.split('/').pop()}
              </Button>
            ))}
          </Collapsible>
        );
      })}
    </Section>
  );
};
