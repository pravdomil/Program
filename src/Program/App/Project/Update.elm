module Program.App.Project.Update exposing (..)

import Dict.Any
import Id
import Program.Api.Declaration
import Program.Api.Project
import Program.App.Model
import Program.App.Msg
import Task


new : Program.App.Model.Model -> ( Program.App.Model.Model, Cmd Program.App.Msg.Msg )
new model =
    ( model
    , Program.Api.Project.new |> Task.perform Program.App.Msg.NewProjectReceived
    )


newReceived : ( Id.Id Program.Api.Project.Project, Program.Api.Project.Project ) -> Program.App.Model.Model -> ( Program.App.Model.Model, Cmd Program.App.Msg.Msg )
newReceived ( id, project ) model =
    ( { model
        | projects = Dict.Any.insert Id.toString id project model.projects
        , activeProject = Just id
      }
    , Cmd.none
    )



--


newDeclaration : Id.Id Program.Api.Project.Project -> Program.App.Model.Model -> ( Program.App.Model.Model, Cmd Program.App.Msg.Msg )
newDeclaration id model =
    ( model
    , Program.Api.Declaration.new |> Task.perform (Program.App.Msg.NewDeclarationReceived id)
    )


newDeclarationReceived : Id.Id Program.Api.Project.Project -> ( Id.Id Program.Api.Declaration.Declaration, Program.Api.Declaration.Declaration ) -> Program.App.Model.Model -> ( Program.App.Model.Model, Cmd Program.App.Msg.Msg )
newDeclarationReceived id ( declarationId, declaration ) model =
    ( { model
        | projects =
            Dict.Any.update
                Id.toString
                id
                (Maybe.map
                    (\x ->
                        { x
                            | declarations = Dict.Any.insert Id.toString declarationId declaration x.declarations
                            , activeDeclaration = Just declarationId
                        }
                    )
                )
                model.projects
      }
    , Cmd.none
    )
