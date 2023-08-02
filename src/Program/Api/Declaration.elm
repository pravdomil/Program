module Program.Api.Declaration exposing (..)

import Id
import Id.Random
import Program.Api.Meta
import Task


type alias Declaration =
    { name : String
    , description : String

    --
    , meta : Program.Api.Meta.Meta
    }


new : Task.Task x ( Id.Id Declaration, Declaration )
new =
    Task.map2
        (\x x2 ->
            ( x
            , Declaration
                "Declaration"
                ""
                x2
            )
        )
        Id.Random.generate
        Program.Api.Meta.new
