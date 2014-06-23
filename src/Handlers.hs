{-# LANGUAGE OverloadedStrings #-}
module Handlers where

import Control.Monad.Trans
import Web.Scotty
import Domain
import Data.Text hiding (map)
import Data.Text.Lazy (toStrict)
import Scotty.Responses

getSession :: ActionM ()
getSession = do
    sid <- param "sessionId"
    _   <- liftIO $ putStrLn ("SessionId is: " ++ show sid)
    _   <- liftIO $ putStrLn ("SessionId value is: " ++ (unpack . sidValue $ sid))
    let session = Session {sessionId = sid, userId = UserId "Vadim"}
    json session

postSession :: ActionM ()
postSession = withUid (\uid -> do
        let session = Session {sessionId = SessionId "newId", userId = uid}
        json session
    )

withUid :: (UserId -> ActionM ()) -> ActionM ()
withUid action = do
    maybeUidString <- header "uid"
    let maybeUid = fmap (UserId . toStrict) maybeUidString
    maybe badRequest action maybeUid