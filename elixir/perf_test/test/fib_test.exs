defmodule FibTest do
  use ExUnit.Case

  test "1st fib" do
    Fib.fib(0, self())
    assert_receive { :result, 1 }
  end
  test "2nd fib" do
    Fib.fib(1, self())
    assert_receive { :result, 1 }
  end
  test "3rd fib" do
    Fib.fib(2, self())
    assert_receive { :result, 2 }
  end
  test "12th fib" do
    Fib.fib(11, self())
    assert_receive { :result, 144 }
  end
end
