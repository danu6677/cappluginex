import { WebPlugin } from '@capacitor/core';

import type { UUID_GetterPlugin } from './definitions';

export class UUID_GetterWeb extends WebPlugin implements UUID_GetterPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

 async getUUID () : Promise<{ value: string }> {

  return {value:"some Mock UUID"};
 }
}
