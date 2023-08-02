module Program.App.Main exposing (..)

import Browser
import Json.Decode
import Program.App.Model
import Program.App.Model.Update
import Program.App.Model.View
import Program.App.Msg


main : Program Json.Decode.Value Program.App.Model.Model Program.App.Msg.Msg
main =
    Browser.application
        { init = Program.App.Model.Update.init
        , update = Program.App.Model.Update.update
        , subscriptions = Program.App.Model.Update.subscriptions
        , view = Program.App.Model.View.view
        , onUrlRequest = Program.App.Msg.UrlRequested
        , onUrlChange = Program.App.Msg.UrlChanged
        }
