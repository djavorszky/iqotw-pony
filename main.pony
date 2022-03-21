use "./y22"

actor Main
  new create(env: Env) =>
    let mar21 = Mar21

    mar21.solve(env.out)



interface Question
  fun description(): String
  be solve(out: OutStream)