module Scotty.Responses where

import Web.Scotty
import Network.HTTP.Types

ok :: ActionM ()
ok = status status200

badRequest :: ActionM ()
badRequest = status status400