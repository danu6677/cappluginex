import { WebPlugin } from '@capacitor/core';
export class UUID_GetterWeb extends WebPlugin {
    async echo(options) {
        console.log('ECHO', options);
        return options;
    }
    async getUUID() {
        return { value: "some Mock UUID" };
    }
}
//# sourceMappingURL=web.js.map