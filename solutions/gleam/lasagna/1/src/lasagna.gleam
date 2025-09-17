const mins_per_layer = 2

// Please define the expected_minutes_in_oven function
pub fn expected_minutes_in_oven() {
  40
}

// Please define the remaining_minutes_in_oven function
pub fn remaining_minutes_in_oven(mins) {
  expected_minutes_in_oven() - mins
}

// Please define the preparation_time_in_minutes function
pub fn preparation_time_in_minutes(layers) {
  layers * mins_per_layer
}

// Please define the total_time_in_minutes function
pub fn total_time_in_minutes(layers, mins) {
  preparation_time_in_minutes(layers) + mins
}

// Please define the alarm function
pub fn alarm() {
  "Ding!"
}
