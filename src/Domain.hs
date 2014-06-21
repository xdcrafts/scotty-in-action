{-# LANGUAGE OverloadedStrings #-}
module Domain where

import Web.Scotty
import Data.Aeson
import Data.Text hiding (take)
import Data.Text.Lazy (toStrict)

data Session = Session
    { sessionId :: SessionId
    , userId    :: UserId
    }

instance ToJSON Session where
    toJSON (Session sid uid) = object ["sessionId" .= sid, "userId" .= uid]

newtype SessionId = SessionId 
    { sidValue :: Text
    } deriving Show

instance Parsable SessionId where
    parseParam stringId = Right $ SessionId (toStrict stringId)

instance ToJSON SessionId where
    toJSON (SessionId value) = toJSON value

newtype UserId = UserId
    { uidValue :: Text
    } deriving Show

instance Parsable UserId where
    parseParam stringId = Right $ UserId (toStrict stringId)

instance ToJSON UserId where
    toJSON (UserId value) = toJSON value