{-# LANGUAGE OverloadedStrings #-}

module LibSpec where

import           Control.Monad.State
import           Lib
import           Test.Hspec

spec :: Spec
spec = do

  describe "Lib" $ do
    describe "getNext" $ do
      it "transforms state" $ do
        evalState ( getNext >>= \x ->
                    getNext >>= \y ->
                    getNext >>= \z ->
                    return z )
                  0
        `shouldBe` -3
    describe "build" $ do
      it "transforms state" $ do
        
