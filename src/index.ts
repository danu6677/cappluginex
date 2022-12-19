import { registerPlugin } from '@capacitor/core';

import type { UUID_GetterPlugin } from './definitions';

const UUID_Getter = registerPlugin<UUID_GetterPlugin>('UUID_Getter', {
  web: () => import('./web').then(m => new m.UUID_GetterWeb()),
});

export * from './definitions';
export { UUID_Getter };
