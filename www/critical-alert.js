const CriticalAlert = function () { }

CriticalAlert.prototype.grantPermission = function ( success, failure, args ) {
	cordova.exec( success, failure, 'CVCriticalAlert', 'grantPermission', args )
}

CriticalAlert.prototype.hasPermission = function ( success, failure, args ) {
	cordova.exec( success, failure, 'CVCriticalAlert', 'hasPermission', args )
}

const criticalAlert = new CriticalAlert()
module.exports = criticalAlert
