import gleam/float
import gleam/int
import gleam/string

pub fn pence_to_pounds(pence: Int) -> Float {
  int.to_float(pence) /. 100.0
}

pub fn pounds_to_string(pounds: Float) -> String {
  pounds
  |> float.to_string()
  |> string.append("£", _)
}
