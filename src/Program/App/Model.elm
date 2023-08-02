module Program.App.Model exposing (..)

import Browser.Router
import Dict.Any
import Element.PravdomilUi.Application
import Id
import Program.Api.Project


type alias Model =
    { router : Browser.Router.Router ()
    , viewportSize : Element.PravdomilUi.Application.ViewportSize

    --
    , projects : Dict.Any.Dict (Id.Id Program.Api.Project.Project) Program.Api.Project.Project
    , activeProject : Maybe (Id.Id Program.Api.Project.Project)
    }
