'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var core = require('@capacitor/core');

const UUID_Getter = core.registerPlugin('UUID_Getter', {
    web: () => Promise.resolve().then(function () { return web; }).then(m => new m.UUID_GetterWeb()),
});

class UUID_GetterWeb extends core.WebPlugin {
    async echo(options) {
        console.log('ECHO', options);
        return options;
    }
    async getUUID() {
        return { value: "some Mock UUID" };
    }
}

var web = /*#__PURE__*/Object.freeze({
    __proto__: null,
    UUID_GetterWeb: UUID_GetterWeb
});

exports.UUID_Getter = UUID_Getter;
//# sourceMappingURL=plugin.cjs.js.map
