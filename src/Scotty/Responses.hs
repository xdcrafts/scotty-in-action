module Scotty.Responses where

import Web.Scotty
import Network.HTTP.Types (status200)

ok :: ActionM ()
ok = status status200
