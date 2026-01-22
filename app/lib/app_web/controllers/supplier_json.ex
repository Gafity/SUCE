defmodule AppWeb.SupplierJSON do
  alias AppWeb.Suppliers.Supplier

  def show(%{supplier: supplier}) do
    %{data: data(supplier)}
  end

  def data(%Supplier{} = supplier) do
    %{
      name: supplier.name,
      total_products_supplied: supplier.total_products_supplied
    }
  end
end
