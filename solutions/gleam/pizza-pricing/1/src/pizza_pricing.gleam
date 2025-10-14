import gleam/list

// TODO: please define the Pizza custom type

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(pizza) -> {
      pizza_price(pizza) + 1
    }
    ExtraToppings(pizza) -> {
      pizza_price(pizza) + 2
    }
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let total_pizza_price = total_pizza_price(order)
  let order_fee = order_fee(order)

  total_pizza_price + order_fee
}

fn total_pizza_price(order: List(Pizza)) -> Int {
  case order {
    [] -> 0
    [pizza, ..rest] -> pizza_price(pizza) + total_pizza_price(rest)
  }
}

fn order_fee(order: List(Pizza)) -> Int {
  case list.length(order) {
    0 -> 0
    length if length > 2 -> 0
    length if length > 1 -> 2
    _ -> 3
  }
}
