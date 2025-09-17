import gleam/int
import gleam/list

// The square of the sum of the first ten natural numbers is
// (1 + 2 + ... + 10)² = 55² = 3025.
pub fn square_of_sum(n: Int) -> Int {
  let sum =
    list.range(1, n)
    |> int.sum()

  sum * sum
}

// The sum of the squares of the first ten natural numbers is
// 1² + 2² + ... + 10² = 385.
pub fn sum_of_squares(n: Int) -> Int {
  let assert Ok(sum) =
    list.range(1, n)
    |> list.reduce(fn(acc, x) { acc + x * x })

  sum
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
