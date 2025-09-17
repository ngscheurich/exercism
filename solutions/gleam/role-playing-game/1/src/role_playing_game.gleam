import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    Some(name) -> name
    None -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health {
    0 if player.level >= 10 ->
      Some(Player(..player, health: 100, mana: Some(100)))
    0 -> Some(Player(..player, health: 100))
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    Some(mana) if mana >= cost -> #(
      Player(..player, mana: Some(mana - cost)),
      cost * 2,
    )
    Some(_) -> #(player, 0)
    None -> #(apply_damage(player, cost), 0)
  }
}

fn apply_damage(player: Player, damage: Int) -> Player {
  case player.health - damage {
    n if n < 0 -> Player(..player, health: 0)
    n -> Player(..player, health: n)
  }
}
