module Web.Geolocation.Navigator
	( geolocation
	) where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Web.HTML.Navigator (Navigator)
import Web.Geolocation (Geolocation)

foreign import _geolocation :: Navigator -> Nullable Geolocation

geolocation :: Navigator -> Maybe Geolocation
geolocation = toMaybe <<< _geolocation
