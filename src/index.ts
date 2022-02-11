import { registerPlugin } from '@capacitor/core';

import type { App_n_DeviceInfoPlugin } from './definitions';

const App_n_DeviceInfo = registerPlugin<App_n_DeviceInfoPlugin>(
  'App_n_DeviceInfo',
  {
    web: () => import('./web').then(m => new m.App_n_DeviceInfoWeb()),
  },
);

export * from './definitions';
export { App_n_DeviceInfo };
