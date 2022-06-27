package com.rajatmalhotra.plugins;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import java.util.Locale;

@CapacitorPlugin(name = "App_n_DeviceInfo")
public class App_n_DeviceInfoPlugin extends Plugin {

    private App_n_DeviceInfo implementation;

    @Override
    public void load() {
        implementation = new App_n_DeviceInfo(getContext());
    }

    @PluginMethod
    public void getId(PluginCall call) {
        JSObject r = new JSObject();

        r.put("uuid", implementation.getUuid());

        call.resolve(r);
    }

    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", implementation.echo(value));
        call.resolve(ret);
    }

    @PluginMethod
    public void getDeviceInfo(PluginCall call) {
        JSObject r = new JSObject();

        r.put("memUsed", implementation.getMemUsed());
        r.put("diskFree", implementation.getDiskFree());
        r.put("diskTotal", implementation.getDiskTotal());
        r.put("realDiskFree", implementation.getRealDiskFree());
        r.put("realDiskTotal", implementation.getRealDiskTotal());
        r.put("model", android.os.Build.MODEL);
        r.put("operatingSystem", "android");
        r.put("osVersion", android.os.Build.VERSION.RELEASE);
        r.put("platform", implementation.getPlatform());
        r.put("manufacturer", android.os.Build.MANUFACTURER);
        r.put("isVirtual", implementation.isVirtual());
        r.put("name", implementation.getName());
        r.put("webViewVersion", implementation.getWebViewVersion());

        call.resolve(r);
    }

    @PluginMethod
    public void getAppInfo(PluginCall call) {
        JSObject r = new JSObject();
        PackageManager manager = getActivity().getPackageManager();
        PackageInfo info = null;
        try {
            info = manager.getPackageInfo(getActivity().getPackageName(), PackageManager.GET_ACTIVITIES);
            r.put("version", info.versionName);
            r.put("build", info.versionCode);
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        call.resolve(r);
    }

    @PluginMethod
    public void getLanguageCode(PluginCall call) {
        JSObject ret = new JSObject();
        ret.put("value", Locale.getDefault().getLanguage());
        call.resolve(ret);
    }

    @PluginMethod
    public void getBatteryInfo(PluginCall call) {
        JSObject r = new JSObject();

        r.put("batteryLevel", implementation.getBatteryLevel());
        r.put("isCharging", implementation.isCharging());

        call.resolve(r);
    }
}
