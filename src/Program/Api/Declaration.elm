module Program.Api.Declaration exposing (..)

import Dict.Any
import Id
import Json.Decode
import Program.Api.FunctionExpression
import Program.Api.Type
import Program.Api.User
import Time


type Declaration
    = Function_ Function
    | AndType_ AndType
    | OrType_ OrType



--


type alias Function =
    { meta : Meta
    , inputs : Dict.Any.Dict (Id.Id Input) Input
    , expression : Program.Api.FunctionExpression.FunctionExpression
    }



--


type alias AndType =
    { meta : Meta
    , inputs : Dict.Any.Dict (Id.Id Input) Input
    , expression : Program.Api.Type.AndExpression
    }



--


type alias OrType =
    { meta : Meta
    , inputs : Dict.Any.Dict (Id.Id Input) Input
    , variants : Dict.Any.Dict (Id.Id Variant) Variant
    }



--


type alias Input =
    { name : String
    , description : String
    , data : Json.Decode.Value
    , order : Float
    }



--


type alias Variant =
    { meta : Meta
    , expression : Program.Api.Type.AndExpression
    }



--


type alias Meta =
    { name : String
    , description : String
    , data : Json.Decode.Value

    --
    , author : Maybe (Id.Id Program.Api.User.User)
    , order : Float

    --
    , created : Time.Posix
    , modified : Time.Posix
    }
