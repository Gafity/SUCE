defmodule App.Supplier do
  use Ecto.Schema
  import Ecto.Changeset
  alias App.Product

  schema "suppliers" do
    field :name, :string
    field :total_products_supplied, :string
    has_many :products, Product

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(supplier, attrs) do
    supplier
    |> cast(attrs, [:name, :total_products_supplied])
    |> validate_required([:name, :total_products_supplied])
  end
end
