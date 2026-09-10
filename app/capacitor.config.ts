import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'org.aicincy.sniffies.workbench',
  appName: 'Sniffies Workbench',
  webDir: 'dist/sniffies-workbench/browser',
  android: {
    allowMixedContent: false
  }
};

export default config;
