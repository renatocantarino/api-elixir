defmodule ElixirBank.Accounts do
  alias ElixirBank.Accounts.{Create}

  defdelegate create(params), to: Create, as: :execute
  # defdelegate get(id), to: Get, as: :execute
  # defdelegate delete(id), to: Delete, as: :execute
  # defdelegate update(params), to: Update, as: :execute
end
