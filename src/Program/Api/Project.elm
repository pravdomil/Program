module Program.Api.Project exposing (..)

import Dict.Any
import Id
import Id.Random
import Json.Decode
import Json.Encode
import Program.Api.Id
import Program.Api.User
import Task
import Time


type alias Project =
    { name : String
    , description : String
    , data : Json.Decode.Value

    --
    , declarations : Dict.Any.Dict (Id.Id Program.Api.Id.Declaration) Program.Api.Id.Declaration
    , selection : List (Id.Id Program.Api.Id.Declaration)

    --
    , author : Maybe (Id.Id Program.Api.User.User)
    , created : Time.Posix
    , modified : Time.Posix
    }


new : Task.Task x ( Id.Id Project, Project )
new =
    Task.map2
        (\x x2 ->
            ( x
            , Project
                "Project"
                ""
                (Json.Encode.object [])
                Dict.Any.empty
                []
                Nothing
                x2
                x2
            )
        )
        Id.Random.generate
        Time.now
