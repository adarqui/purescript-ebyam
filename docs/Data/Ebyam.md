## Module Data.Ebyam

#### `ebyam`

``` purescript
ebyam :: forall a b. Maybe a -> b -> (a -> b) -> b
```

Takes a `Maybe` value, a default value, and a function. If the `Maybe`
value is `Nothing` the default value is returned, otherwise the function
is applied to the value inside the `Just` and the result is returned.

``` purescript
ebyam Nothing x f == x
ebyam (Just y) x f == f y
```

#### `ebyam'`

``` purescript
ebyam' :: forall a b. Maybe a -> (Unit -> b) -> (a -> b) -> b
```

Similar to `ebyam` but for use in cases where the default value may be
expensive to compute. As PureScript is not lazy, the standard `ebyam` has
to evaluate the default value before returning the result, whereas here
the value is only computed when the `Maybe` is known to be `Nothing`.

``` purescript
ebyam' Nothing (\_ -> x) f == x
ebyam' (Just y) (\_ -> x) f == f y
```


### Re-exported from Data.Maybe:

#### `Maybe`

``` purescript
data Maybe a
  = Just a
  | Nothing
```

The `Maybe` type is used to represent optional values and can be seen as
something like a type-safe `null`, where `Nothing` is `null` and `Just x`
is the non-null value `x`.

##### Instances
``` purescript
Functor Maybe
Apply Maybe
Applicative Maybe
Alt Maybe
Plus Maybe
Alternative Maybe
Bind Maybe
Monad Maybe
MonadZero Maybe
Extend Maybe
Invariant Maybe
(Semigroup a) => Semigroup (Maybe a)
(Semigroup a) => Monoid (Maybe a)
(Eq a) => Eq (Maybe a)
(Ord a) => Ord (Maybe a)
(Bounded a) => Bounded (Maybe a)
(Show a) => Show (Maybe a)
```

#### `fromJust`

``` purescript
fromJust :: forall a. Partial => Maybe a -> a
```

A partial function that extracts the value from the `Just` data
constructor. Passing `Nothing` to `fromJust` will throw an error at
runtime.

#### `fromMaybe`

``` purescript
fromMaybe :: forall a. a -> Maybe a -> a
```

Takes a default value, and a `Maybe` value. If the `Maybe` value is
`Nothing` the default value is returned, otherwise the value inside the
`Just` is returned.

``` purescript
fromMaybe x Nothing == x
fromMaybe x (Just y) == y
```

#### `fromMaybe'`

``` purescript
fromMaybe' :: forall a. (Unit -> a) -> Maybe a -> a
```

Similar to `fromMaybe` but for use in cases where the default value may be
expensive to compute. As PureScript is not lazy, the standard `fromMaybe`
has to evaluate the default value before returning the result, whereas here
the value is only computed when the `Maybe` is known to be `Nothing`.

``` purescript
fromMaybe' (\_ -> x) Nothing == x
fromMaybe' (\_ -> x) (Just y) == y
```

#### `isJust`

``` purescript
isJust :: forall a. Maybe a -> Boolean
```

Returns `true` when the `Maybe` value was constructed with `Just`.

#### `isNothing`

``` purescript
isNothing :: forall a. Maybe a -> Boolean
```

Returns `true` when the `Maybe` value is `Nothing`.

#### `maybe`

``` purescript
maybe :: forall a b. b -> (a -> b) -> Maybe a -> b
```

Takes a default value, a function, and a `Maybe` value. If the `Maybe`
value is `Nothing` the default value is returned, otherwise the function
is applied to the value inside the `Just` and the result is returned.

``` purescript
maybe x f Nothing == x
maybe x f (Just y) == f y
```

#### `maybe'`

``` purescript
maybe' :: forall a b. (Unit -> b) -> (a -> b) -> Maybe a -> b
```

Similar to `maybe` but for use in cases where the default value may be
expensive to compute. As PureScript is not lazy, the standard `maybe` has
to evaluate the default value before returning the result, whereas here
the value is only computed when the `Maybe` is known to be `Nothing`.

``` purescript
maybe' (\_ -> x) f Nothing == x
maybe' (\_ -> x) f (Just y) == f y
```

