module Lib where

import           Control.Monad.State

type MyState = Int

valFromState :: MyState -> Int
valFromState s = -s

nextState :: MyState -> MyState
nextState x = 1 + x

type MyStateMonad = State MyState

getNext :: MyStateMonad Int
getNext = state $ \st ->
  let st' = nextState st
  in (valFromState st', st')

inc3 :: MyStateMonad Int
inc3 =
  getNext >>= \x ->
  getNext >>= \y ->
  getNext >>= \z ->
  return z
