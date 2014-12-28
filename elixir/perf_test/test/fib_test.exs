defmodule FibTest do
  use ExUnit.Case

  test "1st fib" do
    Fib.fib(0, self())
    receive do
      { :result, n } -> assert n == 1
    end
  end
  test "2nd fib" do
    Fib.fib(1, self())
    receive do
      { :result, n } -> assert n == 1
    end
  end
  test "3rd fib" do
    Fib.fib(2, self())
    receive do
      { :result, n } -> assert n == 2
    end
  end
  test "12th fib" do
    Fib.fib(11, self())
    receive do
      { :result, n } -> assert n == 144
    end
  end
end
