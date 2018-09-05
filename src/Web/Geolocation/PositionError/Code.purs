module Web.Geolocation.PositionError.Code where

import Prelude

import Data.Enum (class BoundedEnum, class Enum, Cardinality(..), defaultPred, defaultSucc)
import Data.Maybe (Maybe(..))

data Code
	= PermissionDenied
	| PositionUnavailable
	| Timeout

derive instance eqCode :: Eq Code
derive instance ordCode :: Ord Code

instance boundedCode :: Bounded Code where
	bottom = PermissionDenied
	top = Timeout

instance enumCode :: Enum Code where
	succ = defaultSucc toEnum fromEnum
	pred = defaultPred toEnum fromEnum

instance boundedEnumCode :: BoundedEnum Code where
	cardinality = Cardinality 3
	toEnum = toEnum
	fromEnum = fromEnum

instance showCode :: Show Code where
	show = case _ of
		PermissionDenied -> "PermissionDenied"
		PositionUnavailable -> "PositionUnavailable"
		Timeout -> "Timeout"

toEnum :: Int -> Maybe Code
toEnum = case _ of
	1 -> Just PermissionDenied
	2 -> Just PositionUnavailable
	3 -> Just Timeout
	_ -> Nothing

fromEnum :: Code -> Int
fromEnum = case _ of
	PermissionDenied -> 1
	PositionUnavailable -> 2
	Timeout -> 3
