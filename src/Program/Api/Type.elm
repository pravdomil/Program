module Program.Api.Type exposing (..)

import Dict.Any
import Id
import Json.Decode
import Program.Api.Id


type Expression
    = AndExpression_ AndExpression
    | InputExpression_ InputExpression
    | FunctionExpression_ FunctionExpression
    | ReferenceExpression_ ReferenceExpression



--


type alias AndExpression =
    { expressions : Dict.Any.Dict (Id.Id SingleAndExpression) SingleAndExpression
    , extends : Maybe (Id.Id Program.Api.Id.Input)
    }



--


type alias SingleAndExpression =
    { name : String
    , description : String
    , data : Json.Decode.Value
    , expression : Expression
    , order : Float
    }



--


type alias InputExpression =
    { input : Id.Id Program.Api.Id.Input
    }



--


type alias FunctionExpression =
    { expressions : Dict.Any.Dict (Id.Id AndExpression) AndExpression
    }



--


type alias ReferenceExpression =
    { reference : Id.Id Program.Api.Id.Declaration
    , inputs : Dict.Any.Dict (Id.Id Program.Api.Id.Input) AndExpression
    }
