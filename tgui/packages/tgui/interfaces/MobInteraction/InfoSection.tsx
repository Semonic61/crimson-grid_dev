// THIS IS AN RMH UI FILE
import {
  BlockQuote,
  ProgressBar,
  Section,
  Stack,
} from 'tgui-core/components';

import { useBackend } from '../../backend';

type HeaderInfo = {
  isTargetSelf: boolean;
  interactingWith: string;
  pleasure: number;
  maxPleasure: number;
  arousal: number;
  maxArousal: number;
  selfAttributes: string[];
  theirAttributes: string[];
  theirPleasure: number;
  theirMaxPleasure: number;
  theirArousal: number;
  theirMaxArousal: number;
};

export const InfoSection = () => {
  const { data } = useBackend<HeaderInfo>();
  const {
    isTargetSelf,
    interactingWith,
    pleasure,
    maxPleasure,
    arousal,
    maxArousal,
    selfAttributes,
    theirAttributes,
    theirPleasure,
    theirMaxPleasure,
    theirArousal,
    theirMaxArousal,
  } = data;
  return (
    <Section title={interactingWith} fill>
      <Stack vertical fill>
        <Stack.Item>
          <ProgressBar value={arousal} maxValue={maxArousal} color="pink">
            Arousal
          </ProgressBar>
        </Stack.Item>
        <Stack.Item>
          <ProgressBar value={pleasure} maxValue={maxPleasure} color="good">
            Pleasure
          </ProgressBar>
        </Stack.Item>
        {!isTargetSelf && (
          <>
            <Stack.Item>
              <ProgressBar
                value={theirArousal}
                maxValue={theirMaxArousal}
                color="pink"
              >
                Their arousal
              </ProgressBar>
            </Stack.Item>
            <Stack.Item>
              <ProgressBar
                value={theirPleasure}
                maxValue={theirMaxPleasure}
                color="good"
              >
                Their pleasure
              </ProgressBar>
            </Stack.Item>
          </>
        )}
        <Stack.Item grow basis={0}>
          <Section fill scrollable>
            <Stack>
              <Stack.Item grow>
                <BlockQuote>
                  You...
                  <br />
                  {(selfAttributes || []).map((attribute) => (
                    <div key={attribute}>
                      {attribute}
                      <br />
                    </div>
                  ))}
                </BlockQuote>
              </Stack.Item>
              {!isTargetSelf && (
                <Stack.Item grow>
                  <BlockQuote>
                    They...
                    <br />
                    {(theirAttributes || []).map((attribute) => (
                      <div key={attribute}>
                        {attribute}
                        <br />
                      </div>
                    ))}
                  </BlockQuote>
                </Stack.Item>
              )}
            </Stack>
          </Section>
        </Stack.Item>
      </Stack>
    </Section>
  );
};
