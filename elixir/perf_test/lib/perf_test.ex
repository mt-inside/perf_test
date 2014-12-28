defmodule PerfTest do
    def main do
        threads = 10000
        fib_depth = 10

        this = self()
        1..threads |> Enum.each(
            fn _ -> Task.start(
                fn -> fib_get( fib_depth, this ) end
            ) end
        )
        responses = 1..threads |> Enum.reduce( 0,
            fn( _n, count ) ->
                receive do
                    { :result, fib10 } ->
                        if fib10 != 144, do: raise "wrong answer"
                        count + 1
                    #{ :result, fib10 } -> IO.puts fib10
                end
            end
        )
        if responses != threads, do: raise "didn't get all responses"
        IO.puts responses
    end     
    
    defp fib_get( idx, parent ) do
        send( parent, { :result, fib( 1, 1, 0, idx ) } )
    end

    defp fib( prev1, _prev2, idx, limit ) when idx == limit do
        prev1
    end
    defp fib( prev1, prev2, idx, limit ) do
        { new1, new2 } = { prev1 + prev2, prev1 }
        fib( new1, new2, idx + 1, limit )
    end
end
