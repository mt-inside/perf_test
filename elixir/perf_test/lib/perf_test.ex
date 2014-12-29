defmodule PerfTest do
    def main( _args ) do
        threads = 10000
        fib_depth = 11

        this = self()
        1..threads |> Enum.each(
            fn _ -> Task.start(
                fn -> Fib.fib( fib_depth, this ) end
            ) end
        )
        responses = 1..threads |> Enum.reduce( 0,
            fn( _n, count ) ->
                receive do
                    { :result, fib11 } ->
                        if fib11 != 144, do: raise "wrong answer"
                        count + 1
                    #{ :result, fib11 } -> IO.puts fib11
                end
            end
        )
        if responses != threads, do: raise "didn't get all responses"
    end
end
