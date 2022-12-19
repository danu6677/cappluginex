export interface UUID_GetterPlugin {
    echo(options: {
        value: string;
    }): Promise<{
        value: string;
    }>;
    getUUID(): Promise<{
        value: string;
    }>;
}
