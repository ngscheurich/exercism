import gleam/list

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  triangle(a, b, c)
  && list.combination_pairs([a, b, c]) |> list.all(fn(p) { p.0 == p.1 })
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  triangle(a, b, c)
  && list.combination_pairs([a, b, c]) |> list.any(fn(p) { p.0 == p.1 })
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  triangle(a, b, c)
  && list.combination_pairs([a, b, c]) |> list.all(fn(p) { p.0 != p.1 })
}

fn triangle(a: Float, b: Float, c: Float) -> Bool {
  a >. 0.0 && b >. 0.0 && c >. 0.0 && a +. b >. c && b +. c >. a && a +. c >. b
}
