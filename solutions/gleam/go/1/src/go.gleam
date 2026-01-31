import gleam/result

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  case rule1(game) {
    Ok(game) -> {
      case rule3(game) {
        Ok(game) -> {
          case rule4(game) {
            Ok(game) ->
              rule2(game)
              |> change_player()
            Error(err) -> Game(..game, error: err)
          }
        }
        Error(err) -> Game(..game, error: err)
      }
    }
    Error(err) -> Game(..game, error: err)
  }
}

fn change_player(game: Game) -> Game {
  case game.player {
    Black -> Game(..game, player: White)
    White -> Game(..game, player: Black)
  }
}