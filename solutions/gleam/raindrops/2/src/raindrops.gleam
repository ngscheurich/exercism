import gleam/bool
import gleam/int

pub fn convert(number: Int) -> String {
  let result = ""
  let result = bool.guard(number % 3 == 0, result <> "Pling", fn() { result })
  let result = bool.guard(number % 5 == 0, result <> "Plang", fn() { result })
  let result = bool.guard(number % 7 == 0, result <> "Plong", fn() { result })

  case result {
    "" -> int.to_string(number)
    _ -> result
  }
}
