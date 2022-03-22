use "pony_test"
use ".."

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  new make() => None

  fun tag tests(test: PonyTest) =>
    test(_Mar21SolverTestToMinutes)
    test(_Mar21SolverTestSolution)


class iso _Mar21SolverTestToMinutes is UnitTest
  fun name(): String => "to_minutes"

  fun apply(h: TestHelper) ? =>
    h.assert_eq[USize](Mar21Solver.to_minutes("05:30")?, 330)


class iso _Mar21SolverTestSolution is UnitTest
  fun name(): String => "solution"

  fun apply(h: TestHelper) ? =>
    let input: Array[String val] val =
      ["01:00";  "14:10"; "20:05"; "08:15"; "11:30"; "13:45"]

    h.assert_eq[USize](Mar21Solver.smallest_interval(input)?, 25)
