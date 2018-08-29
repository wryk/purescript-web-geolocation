module Web.Geolocation.PositionError
	( PositionError
	, code
	, message
	) where

foreign import data PositionError :: Type

foreign import code :: PositionError -> Int

foreign import message :: PositionError -> String
