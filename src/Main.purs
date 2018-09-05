module Main where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Console (log)
import Web.Geolocation.Geolocation as G
import Web.Geolocation.Coordinates as C
import Web.Geolocation.Navigator as N
import Web.Geolocation.Position as P
import Web.Geolocation.PositionError as PE
import Web.HTML (window)
import Web.HTML.Window (navigator)

main :: Effect Unit
main = do
	n <- window >>= navigator

	case N.geolocation n of
		Just g -> do
			log "geolocation available"

			let onError = \error ->
				log $ "[" <> (show $ PE.code $ error) <> "] " <> (PE.message error)

			let onSuccess = \position -> do
				let c = P.coords position
				log $ (show $ C.latitude c) <> " " <> (show $ C.longitude c)

			_ <- G.getCurrentPosition { enableHighAccuracy: false } onError onSuccess g
			pure unit

		Nothing -> do
			log "geolocation unavailable"
