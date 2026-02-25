pub fn score(x: Float, y: Float) -> Int {
  // Check using a simplified version of the Euclidean distance formula:
  //   distance = x² + y²
  case x *. x +. y *. y {
    d if d <=. 1.0 -> 10
    d if d <=. 25.0 -> 5
    d if d <=. 100.0 -> 1
    _ -> 0
  }
}
