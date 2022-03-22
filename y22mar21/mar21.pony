use "collections"
use "itertools"

actor Main
  let _test_input: Array[String val] val = 
    ["01:00";  "14:10"; "20:05"; "08:15"; "11:30"; "13:45"]
  
  new create(env: Env) =>
    env.out.print("March 21, 2021:")
    try
      let solver = Mar21Solver

      env.out.print("Given a list of times in a 24-hour period, return the smallest interval between two times in the list.")
      env.out.print("['01:00'; '14:10'; '20:05'; '08:15'; '11:30'; '13:45'] => ")
      env.out.print("Alternative: " + solver.smallest_interval_alternative(_test_input)?.string() + " minutes")
    else
      env.out.print("Something went wrong")
    end

class Mar21Solver

  fun to_minutes(time: String): USize ? =>
    let h = time.trim(0, 2).usize()?
    let m = time.trim(3, 5).usize()?

    (h * 60) + m

  fun smallest_interval_brute_force(input: Array[String] val): USize =>
    """
    This is the dumb approach - for each of the input elements, map it to minutes
    after midnight, then compare it with every other element without remorse.

    Time complexity is O(n2)

    The reason for the existence of this function is to practice Pony. See other
    functions for more efficient algorithms.
    """

    let minutes: Array[ISize] = Iter[String](input.values())
      .map[ISize]({(x): ISize ? => Mar21Solver.to_minutes(x)?.isize()})
      .collect(Array[ISize](input.size()))

    var min_interval: USize = 1440

    for m1 in minutes.values() do
      for m2 in minutes.values() do
        if m1 == m2 then
          continue
        end

        min_interval = min_interval.min((m1 - m2).abs().usize())
      end
    end


    min_interval

fun smallest_interval_smarter_brute_force(input: Array[String] val): USize ? =>
    """
    This is another dumb approach - for each of the input elements, map it to minutes
    after midnight, then compare it with every other element after it in the array

    Time complexity is O(n2)

    The reason for the existence of this function is to practice Pony. See other
    functions for more efficient algorithms.
    """

    let minutes: Array[ISize] = Iter[String](input.values())
      .map[ISize]({(x): ISize ? => Mar21Solver.to_minutes(x)?.isize()})
      .collect(Array[ISize](input.size()))

    var min_interval: USize = 1440

    for i in Range(0, minutes.size() - 1) do
      for k in Range(i + 1, minutes.size()) do
        min_interval = min_interval.min((minutes(i)? - minutes(k)?).abs().usize())
      end
    end

    min_interval

  fun smallest_interval_alternative(input: Array[String] val): USize ? =>
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
