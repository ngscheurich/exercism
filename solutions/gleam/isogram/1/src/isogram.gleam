import gleam/list
import gleam/string

pub fn main() {
  echo is_isogram(phrase: "up-to-date")
}

pub fn is_isogram(phrase phrase: String) -> Bool {
  let str =
    phrase
    |> string.lowercase()
    |> string.replace("-", "")
    |> string.replace(" ", "")

  let uniqs =
    str
    |> string.to_graphemes()
    |> list.unique()

  string.length(str) == list.length(uniqs)
}
