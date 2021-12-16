import Foundation

@objc(CVCriticalAlert) class CVCriticalAlert: CDVPlugin {

    @objc(grantPermission:)
    func grantPermission(command: CDVInvokedUrlCommand) {
        // add critical alert options
        var authOptions: UNAuthorizationOptions?
        if #available(iOS 12.0, *) {
            authOptions = [.alert, .badge, .sound, .criticalAlert]
        } else {
            authOptions = [.alert, .badge, .sound]
        }
        UNUserNotificationCenter.current().requestAuthorization(options:authOptions!) { (granted, error) in
            if !granted {
                print("The application requires Notifications permission to display push notifications. Please enable it in settings.")
            }
            let result = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: granted)
            self.commandDelegate!.send(result, callbackId: command.callbackId)
        }
    }

    @objc(hasPermission:)
    func hasPermission(command: CDVInvokedUrlCommand) {
        let semaphore = DispatchSemaphore(value: 0)
        UNUserNotificationCenter.current().getNotificationSettings(completionHandler: { setting in
            var permission:Bool = false
            if #available(iOS 12.0, *) {
                if setting.criticalAlertSetting == .enabled {
                    permission = true
                }
            }
            semaphore.signal()
            let result = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: permission)
            self.commandDelegate!.send(result, callbackId: command.callbackId)
        })
        semaphore.wait()
    }

}