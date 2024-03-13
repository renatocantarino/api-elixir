defmodule ElixirBank.Users do
  alias ElixirBank.Users.{Create, Get, Update}

  defdelegate create(params), to: Create, as: :execute
  defdelegate get(id), to: Get, as: :execute
  defdelegate update(params), to: Update, as: :execute
end
