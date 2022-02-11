import { WebPlugin } from '@capacitor/core';

// import type { AppInfo, App_n_DeviceInfoPlugin, DeviceInfo } from './definitions';

export class App_n_DeviceInfoWeb extends WebPlugin {
    async echo(options: { value: string }): Promise<{ value: string }> {
        console.log('ECHO', options);
        return options;
    }
}
