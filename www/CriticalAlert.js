const CriticalAlert = function () { }

CriticalAlert.prototype.status = function ( success, fail, args ) {
	cordova.exec( success, fail, 'CVCriticalAlert', 'status', args )
}

const criticalAlert = new CriticalAlert()
module.exports = criticalAlert
