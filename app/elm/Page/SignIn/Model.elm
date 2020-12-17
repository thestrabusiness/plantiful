module Page.SignIn.Model exposing (Model, initial)

import Session exposing (Session)


type alias Model =
    { session : Session
    , email : String
    , password : String
    }


initial : Session -> Model
initial session =
    { session = session
    , email = ""
    , password = ""
    }


type alias Response =
    {}
