import gleam/string

pub fn message(log_line: String) -> String {
  let assert Ok(#(_, message)) = string.split_once(log_line, ":")
  string.trim(message)
}

pub fn log_level(log_line: String) -> String {
  let assert Ok(#(log_level, _)) = string.split_once(log_line, ":")

  log_level
  |> string.drop_start(1)
  |> string.drop_end(1)
  |> string.lowercase
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
