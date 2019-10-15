import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)


-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
  { fanName : String
  , subject : String
  , text : String
  , submitted : Bool
  }


init : Model
init =
  Model "" "" "" False



-- UPDATE


type Msg
  = FanName String
  | Subject String
  | Text String
  | SandbergSummonClicked


update : Msg -> Model -> Model
update msg model =
  case msg of
    FanName fanName ->
      { model | fanName = fanName }

    Subject subject ->
      { model | subject = subject }

    Text text ->
      { model | text = text }

    SandbergSummonClicked ->
      { model | submitted = True }



-- VIEW


view : Model -> Html Msg
view model =
  if model.submitted then
    div [ style "color" "green" ] [ text "ANDREAS VAR HER" ]
  else  
    div []
      [ viewInput "text" "FanName" model.fanName FanName
      , viewInput "text" "Subject" model.subject Subject
      , viewInput "text" "Text" model.text Text
      , textarea [ cols 40, rows 10, placeholder "Kjære Sandberg.." ] []
      , button [onClick SandbergSummonClicked ] [ text "Summon Sandberg" ]
      ]


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
  input [ type_ t, placeholder p, value v, onInput toMsg ] []


viewValidation : Model -> Html msg
viewValidation model =
  div [ style "color" "green" ] [ text "OK" ]
