module Main where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Console (log)
import Web.Geolocation as G
import Web.Geolocation.Coordinates as GC
import Web.Geolocation.Navigator as GN
import Web.Geolocation.Position as GP
import Web.Geolocation.PositionError as GPE
import Web.HTML (window)
import Web.HTML.Window (navigator)

main :: Effect Unit
main = do
	n <- window >>= navigator

	case GN.geolocation n of
		Just g -> do
			log "geolocation available"

			let onError = \error ->
				log $ "[" <> (show $ GPE.code $ error) <> "] " <> (GPE.message error)

			let onSuccess = \position -> do
				let c = GP.coords position
				log $ (show $ GC.latitude c) <> " " <> (show $ GC.longitude c)

			_ <- G.getCurrentPosition G.defaultOptions onError onSuccess g
			pure unit

		Nothing -> do
			log "geolocation unavailable"
