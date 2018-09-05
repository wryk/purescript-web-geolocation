module Web.Geolocation.PositionError
	( PositionError
	, code
	, message
	) where

import Prelude

import Data.Maybe (fromMaybe)
import Web.Geolocation.PositionError.Code (Code(..), toEnum)

foreign import data PositionError :: Type

code :: PositionError -> Code
code = fromMaybe (PermissionDenied) <<< toEnum <<< codeImpl

foreign import codeImpl :: PositionError -> Int

foreign import message :: PositionError -> String
