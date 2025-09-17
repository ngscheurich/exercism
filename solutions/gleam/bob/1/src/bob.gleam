// This is giacomocavalieri's solution
// https://exercism.org/tracks/gleam/exercises/bob/solutions/giacomocavalieri
import gleam/string

pub fn hey(remark: String) -> String {
  let trimmed = string.trim(remark)
  let is_question = string.ends_with(trimmed, "?")
  let is_silence = string.is_empty(trimmed)
  let is_yelled =
    trimmed == string.uppercase(trimmed) && trimmed != string.lowercase(trimmed)

  case is_question, is_yelled, is_silence {
    _, _, True -> "Fine. Be that way!"
    True, True, _ -> "Calm down, I know what I'm doing!"
    True, _, _ -> "Sure."
    _, True, _ -> "Whoa, chill out!"
    _, _, _ -> "Whatever."
  }
}
