-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Plantiful.Object.Garden exposing (id, name, owner, users)

import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode
import Plantiful.InputObject
import Plantiful.Interface
import Plantiful.Object
import Plantiful.Scalar
import Plantiful.ScalarCodecs
import Plantiful.Union


id : SelectionSet Plantiful.ScalarCodecs.Id Plantiful.Object.Garden
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Plantiful.ScalarCodecs.codecs |> Plantiful.Scalar.unwrapCodecs |> .codecId |> .decoder)


name : SelectionSet String Plantiful.Object.Garden
name =
    Object.selectionForField "String" "name" [] Decode.string


owner :
    SelectionSet decodesTo Plantiful.Object.User
    -> SelectionSet decodesTo Plantiful.Object.Garden
owner object_ =
    Object.selectionForCompositeField "owner" [] object_ identity


users :
    SelectionSet decodesTo Plantiful.Object.User
    -> SelectionSet (List decodesTo) Plantiful.Object.Garden
users object_ =
    Object.selectionForCompositeField "users" [] object_ (identity >> Decode.list)
