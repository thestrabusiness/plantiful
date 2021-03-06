-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Plantiful.InputObject exposing (CreateCheckInInput, CreateCheckInInputOptionalFields, CreateCheckInInputRequiredFields, CreateGardenInput, CreateGardenInputOptionalFields, CreateGardenInputRequiredFields, CreatePlantInput, CreatePlantInputOptionalFields, CreatePlantInputRequiredFields, SignInInput, SignInInputOptionalFields, SignInInputRequiredFields, SignOutInput, SignOutInputOptionalFields, buildCreateCheckInInput, buildCreateGardenInput, buildCreatePlantInput, buildSignInInput, buildSignOutInput, encodeCreateCheckInInput, encodeCreateGardenInput, encodeCreatePlantInput, encodeSignInInput, encodeSignOutInput)

import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode
import Plantiful.Interface
import Plantiful.Object
import Plantiful.Scalar
import Plantiful.ScalarCodecs
import Plantiful.Union


buildCreateCheckInInput :
    CreateCheckInInputRequiredFields
    -> (CreateCheckInInputOptionalFields -> CreateCheckInInputOptionalFields)
    -> CreateCheckInInput
buildCreateCheckInInput required fillOptionals =
    let
        optionals =
            fillOptionals
                { notes = Absent, clientMutationId = Absent }
    in
    { plantId = required.plantId, watered = required.watered, fertilized = required.fertilized, notes = optionals.notes, clientMutationId = optionals.clientMutationId }


type alias CreateCheckInInputRequiredFields =
    { plantId : Plantiful.ScalarCodecs.Id
    , watered : Bool
    , fertilized : Bool
    }


type alias CreateCheckInInputOptionalFields =
    { notes : OptionalArgument String
    , clientMutationId : OptionalArgument String
    }


{-| Type for the CreateCheckInInput input object.
-}
type alias CreateCheckInInput =
    { plantId : Plantiful.ScalarCodecs.Id
    , watered : Bool
    , fertilized : Bool
    , notes : OptionalArgument String
    , clientMutationId : OptionalArgument String
    }


{-| Encode a CreateCheckInInput into a value that can be used as an argument.
-}
encodeCreateCheckInInput : CreateCheckInInput -> Value
encodeCreateCheckInInput input =
    Encode.maybeObject
        [ ( "plantId", (Plantiful.ScalarCodecs.codecs |> Plantiful.Scalar.unwrapEncoder .codecId) input.plantId |> Just ), ( "watered", Encode.bool input.watered |> Just ), ( "fertilized", Encode.bool input.fertilized |> Just ), ( "notes", Encode.string |> Encode.optional input.notes ), ( "clientMutationId", Encode.string |> Encode.optional input.clientMutationId ) ]


buildCreateGardenInput :
    CreateGardenInputRequiredFields
    -> (CreateGardenInputOptionalFields -> CreateGardenInputOptionalFields)
    -> CreateGardenInput
buildCreateGardenInput required fillOptionals =
    let
        optionals =
            fillOptionals
                { clientMutationId = Absent }
    in
    { name = required.name, clientMutationId = optionals.clientMutationId }


type alias CreateGardenInputRequiredFields =
    { name : String }


type alias CreateGardenInputOptionalFields =
    { clientMutationId : OptionalArgument String }


{-| Type for the CreateGardenInput input object.
-}
type alias CreateGardenInput =
    { name : String
    , clientMutationId : OptionalArgument String
    }


{-| Encode a CreateGardenInput into a value that can be used as an argument.
-}
encodeCreateGardenInput : CreateGardenInput -> Value
encodeCreateGardenInput input =
    Encode.maybeObject
        [ ( "name", Encode.string input.name |> Just ), ( "clientMutationId", Encode.string |> Encode.optional input.clientMutationId ) ]


buildCreatePlantInput :
    CreatePlantInputRequiredFields
    -> (CreatePlantInputOptionalFields -> CreatePlantInputOptionalFields)
    -> CreatePlantInput
buildCreatePlantInput required fillOptionals =
    let
        optionals =
            fillOptionals
                { notes = Absent, clientMutationId = Absent }
    in
    { gardenId = required.gardenId, name = required.name, checkFrequencyUnit = required.checkFrequencyUnit, checkFrequencyScalar = required.checkFrequencyScalar, notes = optionals.notes, clientMutationId = optionals.clientMutationId }


type alias CreatePlantInputRequiredFields =
    { gardenId : Plantiful.ScalarCodecs.Id
    , name : String
    , checkFrequencyUnit : String
    , checkFrequencyScalar : Int
    }


type alias CreatePlantInputOptionalFields =
    { notes : OptionalArgument String
    , clientMutationId : OptionalArgument String
    }


{-| Type for the CreatePlantInput input object.
-}
type alias CreatePlantInput =
    { gardenId : Plantiful.ScalarCodecs.Id
    , name : String
    , checkFrequencyUnit : String
    , checkFrequencyScalar : Int
    , notes : OptionalArgument String
    , clientMutationId : OptionalArgument String
    }


{-| Encode a CreatePlantInput into a value that can be used as an argument.
-}
encodeCreatePlantInput : CreatePlantInput -> Value
encodeCreatePlantInput input =
    Encode.maybeObject
        [ ( "gardenId", (Plantiful.ScalarCodecs.codecs |> Plantiful.Scalar.unwrapEncoder .codecId) input.gardenId |> Just ), ( "name", Encode.string input.name |> Just ), ( "checkFrequencyUnit", Encode.string input.checkFrequencyUnit |> Just ), ( "checkFrequencyScalar", Encode.int input.checkFrequencyScalar |> Just ), ( "notes", Encode.string |> Encode.optional input.notes ), ( "clientMutationId", Encode.string |> Encode.optional input.clientMutationId ) ]


buildSignInInput :
    SignInInputRequiredFields
    -> (SignInInputOptionalFields -> SignInInputOptionalFields)
    -> SignInInput
buildSignInInput required fillOptionals =
    let
        optionals =
            fillOptionals
                { clientMutationId = Absent }
    in
    { email = required.email, password = required.password, clientMutationId = optionals.clientMutationId }


type alias SignInInputRequiredFields =
    { email : String
    , password : String
    }


type alias SignInInputOptionalFields =
    { clientMutationId : OptionalArgument String }


{-| Type for the SignInInput input object.
-}
type alias SignInInput =
    { email : String
    , password : String
    , clientMutationId : OptionalArgument String
    }


{-| Encode a SignInInput into a value that can be used as an argument.
-}
encodeSignInInput : SignInInput -> Value
encodeSignInInput input =
    Encode.maybeObject
        [ ( "email", Encode.string input.email |> Just ), ( "password", Encode.string input.password |> Just ), ( "clientMutationId", Encode.string |> Encode.optional input.clientMutationId ) ]


buildSignOutInput :
    (SignOutInputOptionalFields -> SignOutInputOptionalFields)
    -> SignOutInput
buildSignOutInput fillOptionals =
    let
        optionals =
            fillOptionals
                { clientMutationId = Absent }
    in
    { clientMutationId = optionals.clientMutationId }


type alias SignOutInputOptionalFields =
    { clientMutationId : OptionalArgument String }


{-| Type for the SignOutInput input object.
-}
type alias SignOutInput =
    { clientMutationId : OptionalArgument String }


{-| Encode a SignOutInput into a value that can be used as an argument.
-}
encodeSignOutInput : SignOutInput -> Value
encodeSignOutInput input =
    Encode.maybeObject
        [ ( "clientMutationId", Encode.string |> Encode.optional input.clientMutationId ) ]
