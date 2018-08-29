module Web.Geolocation.Position
	( Position
	, coords
	, timestamp
	) where

import Data.DateTime.Instant (Instant)
import Web.Geolocation.Coordinates (Coordinates)

foreign import data Position :: Type

foreign import coords :: Position -> Coordinates

foreign import timestamp :: Position -> Instant
