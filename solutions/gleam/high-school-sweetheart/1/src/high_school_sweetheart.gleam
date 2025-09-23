import gleam/string

pub fn first_letter(name: String) {
  let trimmed = string.trim(name)
  case string.first(trimmed) {
    Ok(first) -> first
    Error(_) -> "Invalid name"
  }
}

pub fn initial(name: String) {
  name
  |> first_letter()
  |> string.uppercase()
  <> "."
}

pub fn initials(full_name: String) {
  let parts = full_name |> string.split_once(on: " ")

  case parts {
    Ok(#(first, last)) -> initial(first) <> " " <> initial(last)
    Error(_) -> "Invalid name"
  }
}

pub fn pair(full_name1: String, full_name2: String) {
  "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     " <> initials(full_name1) <> "  +  " <> initials(full_name2) <> "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
}
