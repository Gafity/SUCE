defmodule App.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias App.{Supplier, Brand, ProductSupplierLink}

  schema "products" do
    field :name, :string
    field :category, :string
    field :price, :decimal
    field :delivery_date, :utc_datetime_usec
    field :expiration_date, :utc_datetime_usec
    field :quantity_delivered, :integer
    many_to_many :supplier_id, Supplier, join_through: ProductSupplierLink
    belongs_to :brand_id, Brand

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [])
    |> validate_required([])
  end
end
