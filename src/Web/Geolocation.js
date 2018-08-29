"use strict";

exports.getCurrentPosition = function (options) {
	return function (errorFunction) {
		return function (successFunction) {
			return function (geolocation) {
				return function () {
					geolocation.getCurrentPosition(function (position) {
						successFunction(position)();
					}, function (error) {
						errorFunction(error)();
					}, options);
				};
			};
		};
	};
};

exports._watchPosition = function (options) {
	return function (errorFunction) {
		return function (successFunction) {
			return function (geolocation) {
				return function () {
					return geolocation.watchPosition(function (position) {
						successFunction(position)();
					}, function (error) {
						errorFunction(error)();
					}, options);
				};
			};
		};
	};
};

exports._clearWatch = function (id) {
	return function (geolocation) {
		return function () {
			geolocation.clearWatch(id);
		};
	};
};
