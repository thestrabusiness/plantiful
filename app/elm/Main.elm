module Main exposing (Model, Msg(..), init, main, subscriptions, update, view)

import Browser
import Browser.Navigation as Nav
import Html exposing (Html, h1, text)
import Html.Attributes exposing (style)
import Page.SignIn.Model as SignIn
import Session exposing (Session)
import Url



-- MODEL


type Model
    = SignIn SignIn.Model



-- INIT


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init () url key =
    let
        session =
            Session.initial key Session.Guest
    in
    ( SignIn <| SignIn.initial session, Cmd.none )



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Plantiful"
    , body = [ h1 [] [ text "Hello Elm!" ] ]
    }



-- MESSAGE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | HandleSignInMsg {}



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }
