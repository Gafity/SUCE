defmodule AppWeb.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias AppWeb.{Suppliers.Supplier, Brands.Brand, ProductSupplierLinks.ProductSupplierLink}

  schema "products" do
    field :name, :string
    field :category, :string
    field :price, :decimal
    field :delivery_date, :utc_datetime_usec
    field :expiration_date, :utc_datetime_usec
    field :quantity_delivered, :integer
    many_to_many :suppliers, Supplier, join_through: ProductSupplierLink
    belongs_to :brand, Brand

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [
      :name,
      :category,
      :price,
      :delivery_date,
      :expiration_date,
      :quantity_delivered,
      :brand_id
    ])
    |> validate_required([
      :name,
      :category,
      :price,
      :delivery_date,
      :expiration_date,
      :quantity_delivered,
      :brand_id
    ])
    # |> cast_assoc(:brand)
    |> foreign_key_constraint(:brand_id)
  end
end
