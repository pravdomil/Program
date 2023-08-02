module Program.Api.Meta exposing (..)

import Task
import Time


type alias Meta =
    { created : Time.Posix
    , modified : Time.Posix
    }


new : Task.Task x Meta
new =
    Task.map (\x -> Meta x x) Time.now
