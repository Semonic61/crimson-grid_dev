// THIS IS AN RMH UI FILE
import { Button, LabeledList, Section, Stack } from 'tgui-core/components';

import { useBackend } from '../../../backend';

type Genital = {
  name: string;
  slot: string;
  visibility: number;
  aroused: number;
  can_arouse: boolean;
  always_accessible: boolean;
};

type GenitalInfo = { genitals: Genital[] };

const GENITAL_NEVER_SHOW = 1;
const GENITAL_HIDDEN_BY_CLOTHES = 2;
const GENITAL_ALWAYS_SHOW = 3;

const AROUSAL_NONE = 1;
const AROUSAL_PARTIAL = 2;
const AROUSAL_FULL = 3;

type Props = { searchText: string };

export const GenitalTab = ({ searchText }: Props) => {
  const { act, data } = useBackend<GenitalInfo>();
  const { genitals = [] } = data;
  const filtered = genitals.filter((genital) =>
    genital.name.toLowerCase().includes((searchText || '').toLowerCase()),
  );

  return (
    <Section fill scrollable>
      <LabeledList>
        {filtered.map((genital) => (
          <LabeledList.Item key={genital.slot} label={genital.name}>
            <Stack>
              <Stack.Item>
                <Button
                  icon={genital.always_accessible ? 'lock-open' : 'lock'}
                  color={genital.always_accessible ? 'good' : 'default'}
                  tooltip={
                    genital.always_accessible
                      ? 'Always accessible'
                      : 'Normal accessibility'
                  }
                  onClick={() =>
                    act('toggle_genital_accessibility', {
                      genital: genital.slot,
                    })
                  }
                />
              </Stack.Item>
              <Stack.Item>
                <Button
                  icon="eye-slash"
                  selected={genital.visibility === GENITAL_NEVER_SHOW}
                  onClick={() =>
                    act('genital_visibility', {
                      genital: genital.slot,
                      visibility: GENITAL_NEVER_SHOW,
                    })
                  }
                >
                  Hide
                </Button>
              </Stack.Item>
              <Stack.Item>
                <Button
                  icon="shirt"
                  selected={genital.visibility === GENITAL_HIDDEN_BY_CLOTHES}
                  onClick={() =>
                    act('genital_visibility', {
                      genital: genital.slot,
                      visibility: GENITAL_HIDDEN_BY_CLOTHES,
                    })
                  }
                >
                  Clothes
                </Button>
              </Stack.Item>
              <Stack.Item>
                <Button
                  icon="eye"
                  selected={genital.visibility === GENITAL_ALWAYS_SHOW}
                  onClick={() =>
                    act('genital_visibility', {
                      genital: genital.slot,
                      visibility: GENITAL_ALWAYS_SHOW,
                    })
                  }
                >
                  Show
                </Button>
              </Stack.Item>
              {genital.can_arouse && (
                <>
                  <Stack.Item>
                    <Button
                      selected={genital.aroused === AROUSAL_NONE}
                      onClick={() =>
                        act('genital_arousal', {
                          genital: genital.slot,
                          arousal: AROUSAL_NONE,
                        })
                      }
                    >
                      Soft
                    </Button>
                  </Stack.Item>
                  <Stack.Item>
                    <Button
                      selected={genital.aroused === AROUSAL_PARTIAL}
                      onClick={() =>
                        act('genital_arousal', {
                          genital: genital.slot,
                          arousal: AROUSAL_PARTIAL,
                        })
                      }
                    >
                      Half
                    </Button>
                  </Stack.Item>
                  <Stack.Item>
                    <Button
                      selected={genital.aroused === AROUSAL_FULL}
                      onClick={() =>
                        act('genital_arousal', {
                          genital: genital.slot,
                          arousal: AROUSAL_FULL,
                        })
                      }
                    >
                      Full
                    </Button>
                  </Stack.Item>
                </>
              )}
            </Stack>
          </LabeledList.Item>
        ))}
      </LabeledList>
    </Section>
  );
};
