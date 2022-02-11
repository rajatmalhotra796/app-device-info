#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(App_n_DeviceInfoPlugin, "App_n_DeviceInfo",
           CAP_PLUGIN_METHOD(echo, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getDeviceInfo, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getAppInfo, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getLanguageCode, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getBatteryInfo, CAPPluginReturnPromise);
)
