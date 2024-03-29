import Foundation
import Capacitor

@objc public class App_n_DeviceInfo: NSObject {

    @objc public func getCurrentDeviceModel() -> String {
      var systemInfo = utsname()
      uname(&systemInfo)
      let machineMirror = Mirror(reflecting: systemInfo.machine)
      return machineMirror.children.reduce("") { identifier, element in
        guard let value = element.value as? Int8, value != 0 else { return identifier }
        return identifier + String(UnicodeScalar(UInt8(value)))
      }
    }
    
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
    public func getMemoryUsage() -> UInt64 {
        var taskInfo = mach_task_basic_info()
        var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size)/4
        let kerr: kern_return_t = withUnsafeMutablePointer(to: &taskInfo) {
            $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
                task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
            }
        }

        if kerr == KERN_SUCCESS {
            return taskInfo.resident_size
        } else {
            return 0
        }
    }
    /**
     * Get free disk space
     */
    public func getFreeDiskSize() -> Int64? {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if let dictionary = try? FileManager.default.attributesOfFileSystem(forPath: paths.last!) {
            if let freeSize = dictionary[FileAttributeKey.systemFreeSize] as? NSNumber {
                return freeSize.int64Value
            }
        }
        return nil
    }
    /**
     * Get real free disk space
     */
    public func getRealFreeDiskSize() -> Int64? {
        do {
            let values = try URL(fileURLWithPath: NSHomeDirectory() as String).resourceValues(forKeys: [URLResourceKey.volumeAvailableCapacityForImportantUsageKey])
            if let available = values.volumeAvailableCapacityForImportantUsage {
                return available
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
    /**
     * Get total disk size
     */
    public func getTotalDiskSize() -> Int64? {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if let dictionary = try? FileManager.default.attributesOfFileSystem(forPath: paths.last!) {
            if let freeSize = dictionary[FileAttributeKey.systemSize] as? NSNumber {
                return freeSize.int64Value
            }
        }
        return nil
    }
    /**
    * Get Language Code
    */
    public func getLanguageCode() -> String {
        return String(Locale.preferredLanguages[0].prefix(2))
    }
}
