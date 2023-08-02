module Program.App.Model.Update exposing (..)

import Browser.Extra
import Browser.Navigation
import Browser.Router
import Dict.Any
import Element.PravdomilUi.Application
import Json.Decode
import Platform.Extra
import Program.App.Model
import Program.App.Msg
import Program.App.Project.Update
import Task
import Url


init : Json.Decode.Value -> Url.Url -> Browser.Navigation.Key -> ( Program.App.Model.Model, Cmd Program.App.Msg.Msg )
init flags url key =
    ( Program.App.Model.Model
        (Browser.Router.init Browser.Router.urlToFileBaseUrl (always ()) url key)
        (Element.PravdomilUi.Application.flagsToViewportSize flags)
        Dict.Any.empty
        Nothing
    , Cmd.none
    )



--


update : Program.App.Msg.Msg -> Program.App.Model.Model -> ( Program.App.Model.Model, Cmd Program.App.Msg.Msg )
update msg =
    case msg of
        Program.App.Msg.NothingHappened ->
            Platform.Extra.noOperation

        --
        Program.App.Msg.UrlRequested a ->
            Browser.Router.requestUrl Browser.Router.urlToFileBaseUrl a

        Program.App.Msg.UrlChanged a ->
            Browser.Router.urlChanged (always ()) a

        --
        Program.App.Msg.ViewportSizeChanged a ->
            \model -> ( { model | viewportSize = a }, Cmd.none )

        --
        Program.App.Msg.HomepageRequested ->
            \model -> ( model, Browser.Extra.openInNewWindow "https://github.com/pravdomil/Program" |> Task.attempt (\_ -> Program.App.Msg.NothingHappened) )

        --
        Program.App.Msg.NewProjectRequested ->
            Program.App.Project.Update.new

        Program.App.Msg.NewProjectReceived a ->
            Program.App.Project.Update.newReceived a

        Program.App.Msg.NewDeclarationRequested id ->
            Program.App.Project.Update.newDeclaration id

        Program.App.Msg.NewDeclarationReceived a b ->
            Program.App.Project.Update.newDeclarationReceived a b



--


subscriptions : Program.App.Model.Model -> Sub Program.App.Msg.Msg
subscriptions _ =
    Element.PravdomilUi.Application.onViewportSizeChange Program.App.Msg.ViewportSizeChanged
