pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  do_pizza_price(0, pizza)
}

fn do_pizza_price(total: Int, pizza: Pizza) -> Int {
  case pizza {
    Margherita -> total + 7
    Caprese -> total + 9
    Formaggio -> total + 10
    ExtraSauce(pizza) -> do_pizza_price(total + 1, pizza)
    ExtraToppings(pizza) -> do_pizza_price(total + 2, pizza)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  case order {
    [_] -> 3 + do_order_price(order, 0)
    [_, _] -> 2 + do_order_price(order, 0)
    _ -> do_order_price(order, 0)
  }
}

fn do_order_price(order: List(Pizza), price: Int) -> Int {
  case order {
    [] -> price
    [pizza, ..rest] -> do_order_price(rest, price + pizza_price(pizza))
  }
}
