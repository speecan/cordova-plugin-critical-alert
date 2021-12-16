const CriticalAlert = function () { }

CriticalAlert.prototype.grantPermission = function ( success, failure, args ) {
	cordova.exec( success, failure, 'CVCriticalAlert', 'grantPermission', args )
}

CriticalAlert.prototype.hasPermission = function ( success, failure, args ) {
	cordova.exec( success, failure, 'CVCriticalAlert', 'hasPermission', args )
}

CriticalAlert.prototype.openAppSettings = function ( success, failure, args ) {
	cordova.exec( success, failure, 'CVCriticalAlert', 'openAppSettings', args )
}

const criticalAlert = new CriticalAlert()
module.exports = criticalAlert
