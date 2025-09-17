import gleam/int

pub fn convert(number: Int) -> String {
  let result = ""

  let result = case number % 3 {
    0 -> result <> "Pling"
    _ -> result
  }

  let result = case number % 5 {
    0 -> result <> "Plang"
    _ -> result
  }

  let result = case number % 7 {
    0 -> result <> "Plong"
    _ -> result
  }

  case result {
    "" -> int.to_string(number)
    _ -> result
  }
}
