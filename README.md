# cordova-plugin-critical-alert

This plugin provides iOS criticalAlert settings.

## Installation

```
cordova plugin add https://github.com/speecan/cordova-plugin-critical-alert.git
```

## Supported platforms

- iOS

## Methods

- CriticalAlert.grantPermission
- CriticalAlert.hasPermission
- CriticalAlert.openAppSettings

## CriticalAlert.grantPermission

Grant permission to receive critical-alert push notification and return `hasPermission:true`. iOS only

### Parameters

- {function} success - callback function which will be passed the {boolean} permission result as an argument
- {function} error - callback function which will be passed a {string} error message as an argument

```
CriticalAlert.grantPermission(function(hasPermission){
    console.log("Permission was " + (hasPermission ? "granted" : "denied"));
})
```

## CriticalAlert.hasPermission

Check permission to receive critical-alert push notification return the result to a callback function as boolean. On iOS

### Parameters

- {function} success - callback function which will be passed the {boolean} permission result as an argument
- {function} error - callback function which will be passed a {string} error message as an argument

```
CriticalAlert.hasPermission(function(hasPermission){
    console.log("Permission is " + (hasPermission ? "granted" : "denied"));
})
```

## CriticalAlert.openAppSettings

open target app settings (iOS only)

### Parameters

- {function} success - callback function which will be invoked without any argument
- {function} error - callback function which will be passed a {string} error message as an argument

```
CriticalAlert.openAppSettings(function(){
    console.log("Redirect to App Settings Page here");
})
```