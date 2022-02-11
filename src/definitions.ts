/**
 * Plugin which provides the App Info and Device Info. 
 */

export interface App_n_DeviceInfoPlugin {
    echo(options: { value: string }): Promise<{ value: string }>;
    /**
     * Provides the Device Info, in which app is currently running.
     */
    getDeviceInfo(): Promise<DeviceInfo>;
    /**
     * Provides the App Info.
     */
    getAppInfo(): Promise<AppInfo>
    getLanguageCode(): Promise<GetLanguageCodeResult>;
    getBatteryInfo(): Promise<BatteryInfo>;
}

export interface AppInfo {
    /**
     * version tells the version name for both ios and android.
     */
    version: string;
    /**
     * build tells the versionCode in case of android.
     */
    build: string;
}

export type OperatingSystem = 'ios' | 'android' | 'windows' | 'mac' | 'unknown';

export interface GetLanguageCodeResult {
    /**
     * Two character language code.
     *
     * @since 1.0.0
     */
    value: string;
}

export interface BatteryInfo {
    /**
     * A percentage (0 to 1) indicating how much the battery is charged.
     *
     * @since 1.0.0
     */
    batteryLevel?: number;

    /**
     * Whether the device is charging.
     *
     * @since 1.0.0
     */
    isCharging?: boolean;
}

export interface DeviceInfo {
    /**
     * The name of the device. For example, "John's iPhone".
     *
     * This is only supported on iOS and Android 7.1 or above.
     *
     * @since 1.0.0
     */
    name?: string;

    /**
     * The device model. For example, "iPhone".
     *
     * @since 1.0.0
     */
    model: string;

    /**
     * The device localised model.
     *
     * @since 1.0.0
     */
    localModel: string;

    /**
     * The device platform (lowercase).
     *
     * @since 1.0.0
     */
    platform: 'ios' | 'android' | 'web';

    /**
     * The operating system of the device.
     *
     * @since 1.0.0
     */
    operatingSystem: OperatingSystem;

    /**
     * The version of the device OS.
     *
     * @since 1.0.0
     */
    osVersion: string;

    /**
     * The manufacturer of the device.
     *
     * @since 1.0.0
     */
    manufacturer: string;

    /**
     * Whether the app is running in a simulator/emulator.
     *
     * @since 1.0.0
     */
    isVirtual: boolean;

    /**
     * Approximate memory used by the current app, in bytes. Divide by
     * 1048576 to get the number of MBs used.
     *
     * @since 1.0.0
     */
    memUsed?: number;

    /**
     * How much free disk space is available on the the normal data storage
     * path for the os, in bytes.
     *
     * On Android it returns the free disk space on the "system"
     * partition holding the core Android OS.
     * On iOS this value is not accurate.
     *
     * @deprecated Use `realDiskFree`.
     * @since 1.0.0
     */
    diskFree?: number;

    /**
     * The total size of the normal data storage path for the OS, in bytes.
     *
     * On Android it returns the disk space on the "system"
     * partition holding the core Android OS.
     *
     * @deprecated Use `realDiskTotal`.
     * @since 1.0.0
     */
    diskTotal?: number;

    /**
     * How much free disk space is available on the the normal data storage, in bytes.
     *
     * @since 1.1.0
     */
    realDiskFree?: number;

    /**
     * The total size of the normal data storage path, in bytes.
     *
     * @since 1.1.0
     */
    realDiskTotal?: number;

    /**
     * The web view browser version
     *
     * @since 1.0.0
     */
    webViewVersion: string;
}
