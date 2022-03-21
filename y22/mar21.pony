use ".."

actor Mar21 is Solver
  let _test_input: Array[String] = ["01:00";  "14:10"; "20:05"; "08:15"; "11:30"; "13:45"]

  be solve(out: OutStream) =>
    out.print("solved!")

  fun _to_minutes(time: String): USize =>
    0
