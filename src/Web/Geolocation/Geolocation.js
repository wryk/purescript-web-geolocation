"use strict";

exports.getCurrentPositionImpl = function (unit, options, errorCallback, successCallback, geolocation) {
	geolocation.getCurrentPosition(successCallback, errorCallback, options);
	return unit;
};

exports.watchPositionImpl = function (options, errorCallback, successCallback, geolocation) {
	return geolocation.watchPosition(successCallback, errorCallback, options);
};

exports.clearWatchImpl = function (unit, id, geolocation) {
	geolocation.clearWatch(id);
	return unit;
};
