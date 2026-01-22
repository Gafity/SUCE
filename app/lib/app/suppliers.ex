defmodule AppWeb.Suppliers do
  import Ecto.Query, warn: false
  alias App.Repo
  alias AppWeb.Suppliers.Supplier

  def get_supplier!(id), do: Repo.get!(Supplier, id)

  def create_supplier(attrs) do
    %Supplier{}
    |> Supplier.changeset(attrs)
    |> Repo.insert()
  end

  def update_supplier(%Supplier{} = supplier, attrs) do
    supplier
    |> Supplier.changeset(attrs)
    |> Repo.update()
  end

  def delete_supplier(%Supplier{} = supplier) do
    Repo.delete(supplier)
  end
end
