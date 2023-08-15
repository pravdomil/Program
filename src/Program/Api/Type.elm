module Program.Api.Type exposing (..)

import Dict.Any
import Id
import Json.Decode


type Expression
    = AndExpression_ AndTypeExpression
    | InputExpression_ InputTypeExpression
    | FunctionExpression_ FunctionTypeExpression
    | ReferenceExpression_ ReferenceTypeExpression



--


type alias AndTypeExpression =
    { expressions : Dict.Any.Dict (Id.Id SingleAndExpression) SingleAndExpression
    , extends : Maybe (Id.Id Input)
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


type alias InputTypeExpression =
    { input : Id.Id Input
    }



--


type alias FunctionTypeExpression =
    { expressions : Dict.Any.Dict (Id.Id AndTypeExpression) AndTypeExpression
    }



--


type alias ReferenceTypeExpression =
    { reference : Id.Id Declaration
    , inputs : Dict.Any.Dict (Id.Id Input) AndTypeExpression
    }
