defmodule ElixirBank.Users do
  alias ElixirBank.Users.Create

  defdelegate create(params), to: Create, as: :execute
end
