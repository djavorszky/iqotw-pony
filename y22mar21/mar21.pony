use "collections"

actor Main
  let _test_input: Array[String val] val = 
    ["01:00";  "14:10"; "20:05"; "08:15"; "11:30"; "13:45"]
  
  new create(env: Env) =>
    env.out.print("March 21, 2021:")
    try
      let solution = Mar21Solver.smallest_interval(_test_input)?
      env.out.print("Given a list of times in a 24-hour period, return the smallest interval between two times in the list.")
      env.out.print("['01:00'; '14:10'; '20:05'; '08:15'; '11:30'; '13:45'] => " + solution.string() + " minutes")
    else
      env.out.print("Something went wrong")
    end

class Mar21Solver

  fun smallest_interval(input: Array[String] val): USize ? =>
    let minutes = Array[Bool].init(false, 1440)

    // For each of the time, calculate how many minutes it's after midnight
    // and set a bool flag to true at that location

    for time in input.values() do
      let idx = to_minutes(time)?
      minutes(idx)? = true
    end
    
    // loop through the array, and for each of the found values, check if it's
    // the smallest interval

    var last_idx: USize = 0
    var min_interval: USize = 1440

    for i in Range(0, 1440) do
      if minutes(i)? then
        min_interval = min_interval.min(i - last_idx)

        last_idx = i
      end
    end

    min_interval

  fun to_minutes(time: String): USize ? =>
    let h = time.trim(0, 2).usize()?
    let m = time.trim(3, 5).usize()?

    (h * 60) + m