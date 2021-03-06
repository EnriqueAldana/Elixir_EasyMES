ExUnit.start
# File: assertion_test.exs

# 1) Start ExUnit.
ExUnit.start

# 2) Create a new test module (test case) and use "ExUnit.Case".
defmodule AssertionTest do
  # 3) Notice we pass "async: true", this runs the test case
  #    concurrently with other test cases. The individual tests
  #    within each test case are still run serially.
  use ExUnit.Case, async: true

  # 4) Use the "test" macro instead of "def" for clarity.
  test "the truth" do
    assert true
  end
end

#To run the tests above, run the file using
#elixir from the command line.
#Assuming you named the file assertion_test.exs,
#you can run it as:
#elixir assertion_test.exs
