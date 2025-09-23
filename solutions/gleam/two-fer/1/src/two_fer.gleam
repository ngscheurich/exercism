import gleam/option.{type Option, None, Some}

pub fn two_fer(name: Option(String)) -> String {
  let who_fer = case name {
    Some(name) -> name
    None -> "you"
  }

  "One for " <> who_fer <> ", one for me."
}
