module Program.App.Msg exposing (..)

import Browser
import Element.PravdomilUi.Application
import Id
import Program.Api.Declaration
import Program.Api.Project
import Url


type Msg
    = NothingHappened
      --
    | UrlRequested Browser.UrlRequest
    | UrlChanged Url.Url
      --
    | ViewportSizeChanged Element.PravdomilUi.Application.ViewportSize
      --
    | HomepageRequested
      --
    | NewProjectRequested
    | NewProjectReceived ( Id.Id Program.Api.Project.Project, Program.Api.Project.Project )
      --
    | NewDeclarationRequested (Id.Id Program.Api.Project.Project)
    | NewDeclarationReceived (Id.Id Program.Api.Project.Project) ( Id.Id Program.Api.Declaration.Declaration, Program.Api.Declaration.Declaration )
