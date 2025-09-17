pub fn is_leap_year(year: Int) -> Bool {
  case year % 100 {
    0 -> year % 400 == 0
    _ -> year % 4 == 0
  }
}
