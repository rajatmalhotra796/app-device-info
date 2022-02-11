# app-device-info

Fetch the app version and device info.

## Install

```bash
npm install app-device-info
npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`getDeviceInfo()`](#getdeviceinfo)
* [`getAppInfo()`](#getappinfo)
* [`getLanguageCode()`](#getlanguagecode)
* [`getBatteryInfo()`](#getbatteryinfo)
* [Interfaces](#interfaces)
* [Type Aliases](#type-aliases)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

Plugin which provides the App Info and Device Info.

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### getDeviceInfo()

```typescript
getDeviceInfo() => Promise<DeviceInfo>
```

Provides the Device Info, in which app is currently running.

**Returns:** <code>Promise&lt;<a href="#deviceinfo">DeviceInfo</a>&gt;</code>

--------------------


### getAppInfo()

```typescript
getAppInfo() => Promise<AppInfo>
```

Provides the App Info.

**Returns:** <code>Promise&lt;<a href="#appinfo">AppInfo</a>&gt;</code>

--------------------


### getLanguageCode()

```typescript
getLanguageCode() => Promise<GetLanguageCodeResult>
```

**Returns:** <code>Promise&lt;<a href="#getlanguagecoderesult">GetLanguageCodeResult</a>&gt;</code>

--------------------


### getBatteryInfo()

```typescript
getBatteryInfo() => Promise<BatteryInfo>
```

**Returns:** <code>Promise&lt;<a href="#batteryinfo">BatteryInfo</a>&gt;</code>

--------------------


### Interfaces


#### DeviceInfo

| Prop                  | Type                                                        | Description                                                                                                                                                                                                                         | Since |
| --------------------- | ----------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----- |
| **`name`**            | <code>string</code>                                         | The name of the device. For example, "John's iPhone". This is only supported on iOS and Android 7.1 or above.                                                                                                                       | 1.0.0 |
| **`model`**           | <code>string</code>                                         | The device model. For example, "iPhone".                                                                                                                                                                                            | 1.0.0 |
| **`localModel`**      | <code>string</code>                                         | The device localised model.                                                                                                                                                                                                         | 1.0.0 |
| **`platform`**        | <code>'ios' \| 'android' \| 'web'</code>                    | The device platform (lowercase).                                                                                                                                                                                                    | 1.0.0 |
| **`operatingSystem`** | <code><a href="#operatingsystem">OperatingSystem</a></code> | The operating system of the device.                                                                                                                                                                                                 | 1.0.0 |
| **`osVersion`**       | <code>string</code>                                         | The version of the device OS.                                                                                                                                                                                                       | 1.0.0 |
| **`manufacturer`**    | <code>string</code>                                         | The manufacturer of the device.                                                                                                                                                                                                     | 1.0.0 |
| **`isVirtual`**       | <code>boolean</code>                                        | Whether the app is running in a simulator/emulator.                                                                                                                                                                                 | 1.0.0 |
| **`memUsed`**         | <code>number</code>                                         | Approximate memory used by the current app, in bytes. Divide by 1048576 to get the number of MBs used.                                                                                                                              | 1.0.0 |
| **`diskFree`**        | <code>number</code>                                         | How much free disk space is available on the the normal data storage path for the os, in bytes. On Android it returns the free disk space on the "system" partition holding the core Android OS. On iOS this value is not accurate. | 1.0.0 |
| **`diskTotal`**       | <code>number</code>                                         | The total size of the normal data storage path for the OS, in bytes. On Android it returns the disk space on the "system" partition holding the core Android OS.                                                                    | 1.0.0 |
| **`realDiskFree`**    | <code>number</code>                                         | How much free disk space is available on the the normal data storage, in bytes.                                                                                                                                                     | 1.1.0 |
| **`realDiskTotal`**   | <code>number</code>                                         | The total size of the normal data storage path, in bytes.                                                                                                                                                                           | 1.1.0 |
| **`webViewVersion`**  | <code>string</code>                                         | The web view browser version                                                                                                                                                                                                        | 1.0.0 |


#### AppInfo

| Prop          | Type                | Description                                              |
| ------------- | ------------------- | -------------------------------------------------------- |
| **`version`** | <code>string</code> | version tells the version name for both ios and android. |
| **`build`**   | <code>string</code> | build tells the versionCode in case of android.          |


#### GetLanguageCodeResult

| Prop        | Type                | Description                  | Since |
| ----------- | ------------------- | ---------------------------- | ----- |
| **`value`** | <code>string</code> | Two character language code. | 1.0.0 |


#### BatteryInfo

| Prop               | Type                 | Description                                                       | Since |
| ------------------ | -------------------- | ----------------------------------------------------------------- | ----- |
| **`batteryLevel`** | <code>number</code>  | A percentage (0 to 1) indicating how much the battery is charged. | 1.0.0 |
| **`isCharging`**   | <code>boolean</code> | Whether the device is charging.                                   | 1.0.0 |


### Type Aliases


#### OperatingSystem

<code>'ios' | 'android' | 'windows' | 'mac' | 'unknown'</code>

</docgen-api>
