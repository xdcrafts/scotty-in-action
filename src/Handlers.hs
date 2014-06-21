{-# LANGUAGE OverloadedStrings #-}
module Handlers where

import Control.Monad.Trans
import Web.Scotty
import Domain
import Data.Text

getSession :: ActionM ()
getSession = do
    sid <- param "sessionId"
    _   <- liftIO $ putStrLn ("SessionId is: " ++ show sid)
    _   <- liftIO $ putStrLn ("SessionId value is: " ++ (unpack . sidValue $ sid))
    let session = Session {sessionId = sid, userId = UserId "Vadim"}
    json session