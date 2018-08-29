"use strict";

exports.code = function (positionError) {
	return positionError.code;
};

exports.message = function (positionError) {
	return positionError.message;
};
