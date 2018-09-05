"use strict";

exports.getCurrentPositionImpl = function (options, errorCallback, successCallback, geolocation) {
	geolocation.getCurrentPosition(successCallback, errorCallback, options);
};

exports.watchPositionImpl = function (options, errorCallback, successCallback, geolocation) {
	return geolocation.watchPosition(successCallback, errorCallback, options);
};

exports.clearWatchImpl = function (id, geolocation) {
	geolocation.clearWatch(id);
};
