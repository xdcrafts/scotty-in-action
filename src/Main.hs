module Main where

import Web.Scotty
import Routes

main::IO()
main = scotty 3000 routes