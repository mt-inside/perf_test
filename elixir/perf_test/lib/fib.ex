defmodule Fib do
    def fib( n, parent ) do
        send( parent, { :result, Enum.at( fib_stream( ), n ) } )
    end

    defp fib_stream( ) do
        Stream.unfold( {1, 1}, fn s -> fib_next s end )
    end

    defp fib_next( { prev1, prev2 } ) do
        { new1, new2 } = { prev1 + prev2, prev1 }
        { prev2, { new1, new2 } }
    end
end
