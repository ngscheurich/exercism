// Based on th3oth3rjak3's solution
// https://exercism.org/tracks/gleam/exercises/isogram/solutions/th3oth3rjak3
import gleam/list
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  phrase
  |> string.lowercase
  |> string.to_graphemes
  |> list.filter(fn(item) { item != " " && item != "-" })
  |> fn(chars) { chars == list.unique(chars) }
}
