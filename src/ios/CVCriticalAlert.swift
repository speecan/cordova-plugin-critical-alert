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
