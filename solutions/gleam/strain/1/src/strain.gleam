import gleam/list

pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  list.fold(list, [], fn(acc, x) {
    case predicate(x) {
      True -> [x, ..acc]
      False -> acc
    }
  })
  |> list.reverse()
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  list.fold(list, [], fn(acc, x) {
    case predicate(x) {
      False -> [x, ..acc]
      True -> acc
    }
  })
  |> list.reverse()
}
