import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  #(place_location.1, place_location.0)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  list.fold(treasures, 0, fn(acc, treasure) {
    case treasure_location_matches_place_location(place.1, treasure.1) {
      True -> acc + 1
      False -> acc
    }
  })
}

// - The Brass Spyglass can be swapped for any other treasure at the Abandoned Lighthouse.
// - The Amethyst Octopus can be swapped for the Crystal Crab or the Glass Starfish at the Stormy Breakwater.
// - The Vintage Pirate Hat can be swapped for the Model Ship in Large Bottle or the Antique Glass Fishnet Float at the Harbor Managers Office.

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  case place.0 {
    "Abandoned Lighthouse" -> abandoned_lighthouse_swap_possible(found_treasure)
    "Stormy Breakwater" ->
      stormy_breakwater_swap_possible(found_treasure, desired_treasure)
    "Harbor Managers Office" ->
      harbor_managers_office_swap_possible(found_treasure, desired_treasure)
    _ -> False
  }
}

fn abandoned_lighthouse_swap_possible(
  found_treasure: #(String, #(Int, String)),
) -> Bool {
  found_treasure.0 == "Brass Spyglass"
}

fn stormy_breakwater_swap_possible(
  found_treasure: #(String, #(Int, String)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  found_treasure.0 == "Amethyst Octopus"
  && list.contains(["Crystal Crab", "Glass Starfish"], desired_treasure.0)
}

fn harbor_managers_office_swap_possible(
  found_treasure: #(String, #(Int, String)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  found_treasure.0 == "Vintage Pirate Hat"
  && list.contains(
    ["Model Ship in Large Bottle", "Antique Glass Fishnet Float"],
    desired_treasure.0,
  )
}
