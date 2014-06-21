{-# LANGUAGE OverloadedStrings #-}
module Routes where

import Web.Scotty
import Scotty.Responses
import Handlers

routes :: ScottyM ()
routes = do
    get     "/v1/session/:sessionId"    getSession
    get     "/v1/sessions"              ok
    post    "/v1/session"               ok
    put     "/v1/session/:sessionId"    ok
    delete  "/v1/session:sessionId"     ok