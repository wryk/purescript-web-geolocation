module Web.Geolocation
	( Geolocation
	, getCurrentPosition
	, watchPosition
	, clearWatch
	, WatchPositionId
	, defaultOptions
	) where

import Prelude

import Effect (Effect)
import Data.Newtype (class Newtype, unwrap)
import Data.Number (infinity)
import Web.Geolocation.Position (Position)
import Web.Geolocation.PositionError (PositionError)
import Web.Geolocation.PositionOptions (PositionOptions)

foreign import data Geolocation :: Type

defaultOptions :: PositionOptions
defaultOptions =
	{ enableHighAccuracy: false
	, timeout: infinity
	, maximumAge: 0.0
	}

foreign import getCurrentPosition
	:: PositionOptions
	-> (PositionError -> Effect Unit)
	-> (Position -> Effect Unit)
	-> Geolocation
	-> Effect Unit

newtype WatchPositionId = WatchPositionId Int

derive instance newtypeWatchPositionId :: Newtype WatchPositionId _
derive instance eqWatchPositionId :: Eq WatchPositionId
derive instance ordWatchPositionId :: Ord WatchPositionId

foreign import _watchPosition
	:: PositionOptions
	-> (PositionError -> Effect Unit)
	-> (Position -> Effect Unit)
	-> Geolocation
	-> Effect Int

watchPosition
	:: PositionOptions
	-> (PositionError -> Effect Unit)
	-> (Position -> Effect Unit)
	-> Geolocation
	-> Effect WatchPositionId
watchPosition o e s = map WatchPositionId <<< _watchPosition o e s

foreign import _clearWatch :: Int -> Geolocation -> Effect Unit

clearWatch :: WatchPositionId -> Geolocation  -> Effect Unit
clearWatch watchPositionId  = _clearWatch (unwrap watchPositionId)
