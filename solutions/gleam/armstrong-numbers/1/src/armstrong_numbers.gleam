import gleam/int
import gleam/list

pub fn is_armstrong_number(number: Int) -> Bool {
  let assert Ok(digits) = int.digits(number, 10)
  let digits_count = list.length(digits)

  let sum =
    digits
    |> list.map(int_power(_, digits_count))
    |> int.sum

  sum == number
}

fn int_power(base: Int, exp: Int) -> Int {
  case exp {
    0 -> 1
    n -> base * int_power(base, n - 1)
  }
}
