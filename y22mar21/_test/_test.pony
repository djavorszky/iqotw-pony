use "pony_test"
use ".."

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  new make() => None

  fun tag tests(test: PonyTest) =>
    test(_Mar21ToMinutesTest)
    test(_Mar21EfficientTest)
    test(_Mar21AlternativeTest)
    test(_Mar21BruteForceTest)
    test(_Mar21SmarterBruteForceTest)


class iso _Mar21ToMinutesTest is UnitTest
  fun name(): String => "to_minutes"

  fun apply(h: TestHelper) ? =>
    h.assert_eq[USize](Mar21Solver.to_minutes("05:30")?, 330)


class iso _Mar21EfficientTest is UnitTest
  fun name(): String => "efficient solution"

  fun apply(h: TestHelper) ? =>
    let input: Array[String val] val =
      ["01:00";  "14:10"; "20:05"; "08:15"; "11:30"; "13:45"]

    h.assert_eq[USize](Mar21Solver.smallest_interval_with_sorting(input)?, 25)


class iso _Mar21AlternativeTest is UnitTest
  fun name(): String => "alternative solution"

  fun apply(h: TestHelper) ? =>
    let input: Array[String val] val =
      ["01:00";  "14:10"; "20:05"; "08:15"; "11:30"; "13:45"]

    h.assert_eq[USize](Mar21Solver.smallest_interval_alternative(input)?, 25)


class iso _Mar21BruteForceTest is UnitTest
  fun name(): String => "brute force solution"

  fun apply(h: TestHelper) =>
    let input: Array[String val] val =
      ["01:00";  "14:10"; "20:05"; "08:15"; "11:30"; "13:45"]

    h.assert_eq[USize](Mar21Solver.smallest_interval_brute_force(input), 25)


class iso _Mar21SmarterBruteForceTest is UnitTest
  fun name(): String => "smarter brute force solution"

  fun apply(h: TestHelper) ? =>
    let input: Array[String val] val =
      ["01:00";  "14:10"; "20:05"; "08:15"; "11:30"; "13:45"]

    h.assert_eq[USize](Mar21Solver.smallest_interval_smarter_brute_force(input)?, 25)
