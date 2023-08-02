module Program.Api.Project exposing (..)

import Dict.Any
import Id
import Id.Random
import Program.Api.Declaration
import Program.Api.Meta
import Task


type alias Project =
    { name : String
    , description : String

    --
    , declarations : Dict.Any.Dict (Id.Id Program.Api.Declaration.Declaration) Program.Api.Declaration.Declaration
    , activeDeclaration : Maybe (Id.Id Program.Api.Declaration.Declaration)

    --
    , meta : Program.Api.Meta.Meta
    }


new : Task.Task x ( Id.Id Project, Project )
new =
    Task.map2
        (\x x2 ->
            ( x
            , Project
                "Project"
                ""
                Dict.Any.empty
                Nothing
                x2
            )
        )
        Id.Random.generate
        Program.Api.Meta.new
