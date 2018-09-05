"use strict";

exports.codeImpl = function (positionError) {
	return positionError.code;
};

exports.message = function (positionError) {
	return positionError.message;
};
