module Session exposing (AuthenticatedUser(..), Session, currentUser, initial)

import Browser.Navigation as Navigation


type AuthenticatedUser
    = Guest
    | User UserData


type alias UserData =
    { firstName : String
    , lastName : String
    , authenticationToken : String
    }


type alias Session =
    { navKey : Navigation.Key
    , authenticatedUser : AuthenticatedUser
    }


initial : Navigation.Key -> AuthenticatedUser -> Session
initial key authenticatedUser =
    Session key authenticatedUser


currentUser : Session -> Maybe UserData
currentUser { authenticatedUser } =
    case authenticatedUser of
        Guest ->
            Nothing

        User userData ->
            Just userData
