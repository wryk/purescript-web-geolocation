"use strict";

exports.latitude = function (coordinates) {
	return coordinates.latitude;
};

exports.longitude = function (coordinates) {
	return coordinates.latitude;
};

exports._altitude = function (coordinates) {
	return coordinates.altitude;
};

exports.accuracy = function (coordinates) {
	return coordinates.accuracy;
};

exports._altitudeAccuracy = function (coordinates) {
	return coordinates.altitudeAccuracy;
};

exports._heading = function (coordinates) {
	return coordinates.heading;
};

exports._speed = function (coordinates) {
	return coordinates.speed;
};
