-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Plantiful.Mutation exposing (CreateCheckInRequiredArguments, CreateGardenRequiredArguments, CreatePlantRequiredArguments, SignInRequiredArguments, SignOutRequiredArguments, createCheckIn, createGarden, createPlant, signIn, signOut)

import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode exposing (Decoder)
import Plantiful.InputObject
import Plantiful.Interface
import Plantiful.Object
import Plantiful.Scalar
import Plantiful.ScalarCodecs
import Plantiful.Union


type alias CreateCheckInRequiredArguments =
    { input : Plantiful.InputObject.CreateCheckInInput }


{-| Add a check in for the given plant
-}
createCheckIn :
    CreateCheckInRequiredArguments
    -> SelectionSet decodesTo Plantiful.Object.CreateCheckInPayload
    -> SelectionSet (Maybe decodesTo) RootMutation
createCheckIn requiredArgs object_ =
    Object.selectionForCompositeField "createCheckIn" [ Argument.required "input" requiredArgs.input Plantiful.InputObject.encodeCreateCheckInInput ] object_ (identity >> Decode.nullable)


type alias CreateGardenRequiredArguments =
    { input : Plantiful.InputObject.CreateGardenInput }


{-| Creates a new garden for the current user
-}
createGarden :
    CreateGardenRequiredArguments
    -> SelectionSet decodesTo Plantiful.Object.CreateGardenPayload
    -> SelectionSet (Maybe decodesTo) RootMutation
createGarden requiredArgs object_ =
    Object.selectionForCompositeField "createGarden" [ Argument.required "input" requiredArgs.input Plantiful.InputObject.encodeCreateGardenInput ] object_ (identity >> Decode.nullable)


type alias CreatePlantRequiredArguments =
    { input : Plantiful.InputObject.CreatePlantInput }


{-| Creates a new plant for the current user
-}
createPlant :
    CreatePlantRequiredArguments
    -> SelectionSet decodesTo Plantiful.Object.CreatePlantPayload
    -> SelectionSet (Maybe decodesTo) RootMutation
createPlant requiredArgs object_ =
    Object.selectionForCompositeField "createPlant" [ Argument.required "input" requiredArgs.input Plantiful.InputObject.encodeCreatePlantInput ] object_ (identity >> Decode.nullable)


type alias SignInRequiredArguments =
    { input : Plantiful.InputObject.SignInInput }


{-| Sign a user in with email and password
-}
signIn :
    SignInRequiredArguments
    -> SelectionSet decodesTo Plantiful.Object.SignInPayload
    -> SelectionSet (Maybe decodesTo) RootMutation
signIn requiredArgs object_ =
    Object.selectionForCompositeField "signIn" [ Argument.required "input" requiredArgs.input Plantiful.InputObject.encodeSignInInput ] object_ (identity >> Decode.nullable)


type alias SignOutRequiredArguments =
    { input : Plantiful.InputObject.SignOutInput }


{-| Sign out the current user
-}
signOut :
    SignOutRequiredArguments
    -> SelectionSet decodesTo Plantiful.Object.SignOutPayload
    -> SelectionSet (Maybe decodesTo) RootMutation
signOut requiredArgs object_ =
    Object.selectionForCompositeField "signOut" [ Argument.required "input" requiredArgs.input Plantiful.InputObject.encodeSignOutInput ] object_ (identity >> Decode.nullable)
