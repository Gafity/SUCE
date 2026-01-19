defmodule App.ProductSupplierLink do
  use Ecto.Schema
  import Ecto.Changeset
  alias App.{Supplier, Product}

  @primary_key false
  schema "product_supplier_links" do
    belongs_to :product, Product
    belongs_to :supplier, Supplier

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [])
    |> validate_required([])
  end
end
