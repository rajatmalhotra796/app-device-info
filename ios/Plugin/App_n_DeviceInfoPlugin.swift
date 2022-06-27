import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(App_n_DeviceInfoPlugin)
public class App_n_DeviceInfoPlugin: CAPPlugin {
    private let implementation = App_n_DeviceInfo()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
    @objc func getDeviceInfo(_ call: CAPPluginCall) {
        var isSimulator = false
        #if targetEnvironment(simulator)
        isSimulator = true
        #endif

        let memUsed = implementation.getMemoryUsage()
        let diskFree = implementation.getFreeDiskSize() ?? 0
        let realDiskFree = implementation.getRealFreeDiskSize() ?? 0
        let diskTotal = implementation.getTotalDiskSize() ?? 0
        let currentDeviceModel = implementation.getCurrentDeviceModel()

        call.resolve([
            "memUsed": memUsed,
            "diskFree": diskFree,
            "diskTotal": diskTotal,
            "realDiskFree": realDiskFree,
            "realDiskTotal": diskTotal,
            "name": UIDevice.current.name,
            "model": UIDevice.current.model,
            "localModel": UIDevice.current.localizedModel,
            "currentDeviceModel": currentDeviceModel,
            "operatingSystem": "ios",
            "osVersion": UIDevice.current.systemVersion,
            "platform": "ios",
            "manufacturer": "Apple",
            "isVirtual": isSimulator,
            "webViewVersion": UIDevice.current.systemVersion
        ])
    }

    @objc func getLanguageCode(_ call: CAPPluginCall) {
        let code = implementation.getLanguageCode()
        call.resolve([
            "value": code
        ])
    }
    @objc func getBatteryInfo(_ call: CAPPluginCall) {
        UIDevice.current.isBatteryMonitoringEnabled = true

        call.resolve([
            "batteryLevel": UIDevice.current.batteryLevel,
            "isCharging": UIDevice.current.batteryState == .charging || UIDevice.current.batteryState == .full
        ])

        UIDevice.current.isBatteryMonitoringEnabled = false
    }
    @objc func getAppInfo(_ call: CAPPluginCall) {
        let currentVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        let currentBuild = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
        call.resolve([
            "version": currentVersion,
            "build": currentBuild
        ])
    }    
}
