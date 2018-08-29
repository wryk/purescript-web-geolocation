module Web.Geolocation.Coordinates
	( Coordinates
	, latitude
	, longitude
	, altitude
	, accuracy
	, altitudeAccuracy
	, heading
	, speed
	) where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)

foreign import data Coordinates :: Type

foreign import latitude :: Coordinates -> Number

foreign import longitude :: Coordinates -> Number

foreign import _altitude :: Coordinates -> Nullable Number

altitude :: Coordinates -> Maybe Number
altitude = toMaybe <<< _altitude

foreign import accuracy :: Coordinates -> Number

foreign import _altitudeAccuracy :: Coordinates -> Nullable Number

altitudeAccuracy :: Coordinates -> Maybe Number
altitudeAccuracy = toMaybe <<< _altitudeAccuracy

foreign import _heading :: Coordinates -> Nullable Number

heading :: Coordinates -> Maybe Number
heading = toMaybe <<< _heading

foreign import _speed :: Coordinates -> Nullable Number

speed :: Coordinates -> Maybe Number
speed = toMaybe <<< _speed
