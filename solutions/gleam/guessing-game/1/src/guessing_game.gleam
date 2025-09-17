pub fn reply(guess: Int) -> String {
  case guess {
    42 -> "Correct"
    41 | 43 -> "So close"
    n if n > 42 -> "Too high"
    n if n < 42 -> "Too low"
    _ -> "Invalid guess"
  }
}
