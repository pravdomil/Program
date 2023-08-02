module Program.Api.Project.Utils exposing (..)

import Dict.Any
import Id
import Id.Random
import Program.Api.Meta
import Program.Api.Project
import Task


new : Task.Task x ( Id.Id Program.Api.Project.Project, Program.Api.Project.Project )
new =
    Task.map2
        (\x x2 ->
            ( x
            , Program.Api.Project.Project
                "Project"
                ""
                Dict.Any.empty
                Nothing
                x2
            )
        )
        Id.Random.generate
        Program.Api.Meta.new
