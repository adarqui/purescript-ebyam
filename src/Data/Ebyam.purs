module Data.Ebyam (
  module Data.Maybe,
  ebyam,
  ebyam'
) where



import Data.Maybe
import Data.Unit  (Unit)



-- | Takes a `Maybe` value, a default value, and a function. If the `Maybe`
-- | value is `Nothing` the default value is returned, otherwise the function
-- | is applied to the value inside the `Just` and the result is returned.
-- |
-- | ``` purescript
-- | ebyam Nothing x f == x
-- | ebyam (Just y) x f == f y
-- | ```

ebyam :: forall a b. Maybe a -> b -> (a -> b) -> b
ebyam m_a b f = maybe b f m_a



-- | Similar to `ebyam` but for use in cases where the default value may be
-- | expensive to compute. As PureScript is not lazy, the standard `ebyam` has
-- | to evaluate the default value before returning the result, whereas here
-- | the value is only computed when the `Maybe` is known to be `Nothing`.
-- |
-- | ``` purescript
-- | ebyam' Nothing (\_ -> x) f == x
-- | ebyam' (Just y) (\_ -> x) f == f y
-- | ```

ebyam' :: forall a b. Maybe a -> (Unit -> b) -> (a -> b) -> b
ebyam' m_a g f = maybe' g f m_a
