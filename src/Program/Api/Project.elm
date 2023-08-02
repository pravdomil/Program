module Program.Api.Project exposing (..)

import Dict.Any
import Id
import Program.Api.Declaration
import Program.Api.Meta


type alias Project =
    { name : String
    , description : String

    --
    , declarations : Dict.Any.Dict (Id.Id Program.Api.Declaration.Declaration) Program.Api.Declaration.Declaration
    , activeDeclaration : Maybe (Id.Id Program.Api.Declaration.Declaration)

    --
    , meta : Program.Api.Meta.Meta
    }
