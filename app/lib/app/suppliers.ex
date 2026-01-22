defmodule AppWeb.Suppliers do
  import Ecto.Query, warn: false
  alias App.Repo
  alias AppWeb.Suppliers.Supplier

  def create_supplier(attrs) do
    %Supplier{}
    |> Supplier.changeset(attrs)
    |> Repo.insert()
  end
end
