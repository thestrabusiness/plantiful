-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Plantiful.Object.SignInPayload exposing (clientMutationId, errors, success, user)

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


{-| A unique identifier for the client performing the mutation.
-}
clientMutationId : SelectionSet (Maybe String) Plantiful.Object.SignInPayload
clientMutationId =
    Object.selectionForField "(Maybe String)" "clientMutationId" [] (Decode.string |> Decode.nullable)


errors : SelectionSet (Maybe (List String)) Plantiful.Object.SignInPayload
errors =
    Object.selectionForField "(Maybe (List String))" "errors" [] (Decode.string |> Decode.list |> Decode.nullable)


success : SelectionSet Bool Plantiful.Object.SignInPayload
success =
    Object.selectionForField "Bool" "success" [] Decode.bool


user :
    SelectionSet decodesTo Plantiful.Object.User
    -> SelectionSet decodesTo Plantiful.Object.SignInPayload
user object_ =
    Object.selectionForCompositeField "user" [] object_ identity
