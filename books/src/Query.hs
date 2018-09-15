module Query where

import           Author
import           Book
import           Data.List

class Query a where
  top15AuthorsByLastName :: [a] -> [Author]
  authorsFrom1900s :: [a] -> [Author]

instance Query Author where
  authorsFrom1900s = filter (\author -> birthYear author >= 1900)
  top15AuthorsByLastName =
    take 15
    . sortBy (\a b -> compare [lastName a, firstName a] [lastName b, firstName b])
    . nub

instance Query Book where
  authorsFrom1900s = authorsFrom1900s . map author
  top15AuthorsByLastName = top15AuthorsByLastName . map author