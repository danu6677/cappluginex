import { WebPlugin } from '@capacitor/core';
import type { UUID_GetterPlugin } from './definitions';
export declare class UUID_GetterWeb extends WebPlugin implements UUID_GetterPlugin {
    echo(options: {
        value: string;
    }): Promise<{
        value: string;
    }>;
    getUUID(): Promise<{
        value: string;
    }>;
}
