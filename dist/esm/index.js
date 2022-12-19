import { registerPlugin } from '@capacitor/core';
const UUID_Getter = registerPlugin('UUID_Getter', {
    web: () => import('./web').then(m => new m.UUID_GetterWeb()),
});
export * from './definitions';
export { UUID_Getter };
//# sourceMappingURL=index.js.map