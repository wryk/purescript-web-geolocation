module Web.Geolocation
	( Geolocation
	, Options
	, getCurrentPosition
	, watchPosition
	, clearWatch
	, WatchPositionId
	) where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn4, mkEffectFn1, runEffectFn2, runEffectFn4)
import Data.Newtype (class Newtype, unwrap)
import Type.Row (class Union)
import Web.Geolocation.Position (Position)
import Web.Geolocation.PositionError (PositionError)

foreign import data Geolocation :: Type

type Options =
	( enableHighAccuracy :: Boolean
	, timeout :: Number
	, maximumAge :: Number
	)

foreign import getCurrentPositionImpl
	:: ∀ options
	. EffectFn4
		(Record options)
		(EffectFn1 PositionError Unit)
		(EffectFn1 Position Unit)
		Geolocation
		Unit

getCurrentPosition
	:: ∀ options trash
	. Union options trash Options
	=> Record options
	-> (PositionError -> Effect Unit)
	-> (Position -> Effect Unit)
	-> Geolocation
	-> Effect Unit
getCurrentPosition o e s = runEffectFn4 getCurrentPositionImpl o (mkEffectFn1 e) (mkEffectFn1 s)

newtype WatchPositionId = WatchPositionId Int

derive instance newtypeWatchPositionId :: Newtype WatchPositionId _
derive instance eqWatchPositionId :: Eq WatchPositionId
derive instance ordWatchPositionId :: Ord WatchPositionId

foreign import watchPositionImpl
	:: ∀ options
	. EffectFn4
		(Record options)
		(EffectFn1 PositionError Unit)
		(EffectFn1 Position Unit)
		Geolocation
		Int

watchPosition
	:: ∀ options trash
	. Union options trash Options
	=> Record options
	-> (PositionError -> Effect Unit)
	-> (Position -> Effect Unit)
	-> Geolocation
	-> Effect WatchPositionId
watchPosition o e s = map WatchPositionId <<< runEffectFn4 watchPositionImpl o (mkEffectFn1 e) (mkEffectFn1 s)

foreign import clearWatchImpl :: EffectFn2 Int Geolocation Unit

clearWatch :: WatchPositionId -> Geolocation -> Effect Unit
clearWatch watchPositionId = runEffectFn2 clearWatchImpl (unwrap watchPositionId)
