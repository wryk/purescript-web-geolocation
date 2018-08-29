module Web.Geolocation.PositionOptions
	( PositionOptions
	) where

type PositionOptions =
	{ enableHighAccuracy :: Boolean
	, timeout :: Number
	, maximumAge :: Number
	}
