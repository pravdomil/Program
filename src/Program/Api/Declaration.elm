module Program.Api.Declaration exposing (..)

import Dict.Any
import Id
import Json.Decode
import Program.Api.FunctionExpression
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
    , expression : AndTypeExpression
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
    , expression : AndTypeExpression
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



-- TYPE


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
