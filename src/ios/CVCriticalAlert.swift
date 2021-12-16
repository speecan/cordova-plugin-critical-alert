import Foundation

@objc(CVCriticalAlert) class CVCriticalAlert: CDVPlugin {
    @objc(grantPermission:)
    func grantPermission(command: CDVInvokedUrlCommand) {
        // get permission
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
}

@objc(CVCriticalAlert) class CVCriticalAlert: CDVPlugin {
    @objc(hasPermission:)
    func hasPermission(command: CDVInvokedUrlCommand) {
        // get permission
        var authOptions: UNAuthorizationOptions?
        if #available(iOS 12.0, *) {
            authOptions = [.alert, .badge, .sound, .criticalAlert]
        } else {
            authOptions = [.alert, .badge, .sound]
        }
        let semaphore = DispatchSemaphore(value: 0)
        UNUserNotificationCenter.current().getNotificationSettings(completionHandler: {setting in
            if setting.authorizationStatus == .authorized {
                print("許可")
            } else {
                print("未許可")
            }
            print(setting)
            semaphore.signal()
            let result = CDVPluginResult(status: CDVCommandStatus_OK, messageAsDictionary: setting)
            self.commandDelegate!.send(result, callbackId: command.callbackId)
        })
        semaphore.wait()
    }
}
