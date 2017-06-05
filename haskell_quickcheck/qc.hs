{-# LANGUAGE TemplateHaskell #-}

import Test.QuickCheck

myAdd :: Num a => a -> a -> a
myAdd a b = a + b

-- prop_myAdd :: Eq a => a -> Bool
prop_myAdd :: (Num a, Eq a) => a -> a -> Bool
prop_myAdd a b = myAdd a b == myAdd b a


-- need this for QuickCheck , see https://hackage.haskell.org/package/QuickCheck/docs/Test-QuickCheck-All.html
return []

runTests :: IO Bool
runTests = $(quickCheckAll)

main :: IO Bool
main = runTests
