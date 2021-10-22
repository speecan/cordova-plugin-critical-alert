import Foundation

@objc(CVCriticalAlert) class CVCriticalAlert: CDVPlugin {

   // JavaScriptに公開する関数名を記述
   @objc(status:)
   func status(command: CDVInvokedUrlCommand) {

     // パラメーターの取得
     let param:String = command.arguments?[0] as! String

     // 返却するレスポンスを作成
     let result = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "レスポンス：" + param)

     // コールバック形式でレスポンスを返却
     self.commandDelegate!.send(result, callbackId: command.callbackId)
   }
}
