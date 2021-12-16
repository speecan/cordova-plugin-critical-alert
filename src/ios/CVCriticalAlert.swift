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
        // refer: https://developer.apple.com/documentation/usernotifications/unusernotificationcenter/1649527-requestauthorization
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
        // refer: https://developer.apple.com/documentation/usernotifications/unusernotificationcenter/1649524-getnotificationsettings
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

    @objc(openAppSettings:)
    func openAppSettings(command: CDVInvokedUrlCommand) {
        // refer: https://developer.apple.com/documentation/uikit/uiapplication/1623042-opensettingsurlstring
        if let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: { opened in
                let result = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: opened)
                self.commandDelegate!.send(result, callbackId: command.callbackId)
            })
        }
    }

}