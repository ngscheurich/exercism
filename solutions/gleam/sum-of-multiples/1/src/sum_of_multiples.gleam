import gleam/int
import gleam/list

// factors -> magical items
// limit   -> level
pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  factors
  |> list.flat_map(multiples_within_limit(_, limit))
  |> list.unique()
  |> int.sum()
}

fn multiples_within_limit(factor: Int, limit: Int) -> List(Int) {
  case factor {
    0 -> []
    n -> do_multiples_within_limit(n, limit, 1, [])
  }
}

fn do_multiples_within_limit(
  factor: Int,
  limit: Int,
  multiplier: Int,
  multiples: List(Int),
) -> List(Int) {
  let product = factor * multiplier
  case product < limit {
    True ->
      do_multiples_within_limit(
        factor,
        limit,
        multiplier + 1,
        list.append(multiples, [product]),
      )
    False -> multiples
  }
}
