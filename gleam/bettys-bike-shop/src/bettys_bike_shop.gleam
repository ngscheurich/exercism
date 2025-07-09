import gleam/float
import gleam/int
import gleam/string

pub fn pence_to_pounds(pence: Int) -> Float {
  let assert Ok(pounds) =
    pence
    |> int.to_float()
    |> float.divide(100.0)

  pounds
}

pub fn pounds_to_string(pounds: Float) -> String {
  pounds
  |> float.to_string()
  |> string.append("£", _)
}
