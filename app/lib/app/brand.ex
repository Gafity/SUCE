defmodule App.Brand do
  use Ecto.Schema
  import Ecto.Changeset

  schema "brands" do
    field :brand, :string

    timestamps(type: :utc_datetime_usec)
  end

  @doc false
  def changeset(brand, attrs) do
    brand
    |> cast(attrs, [:brand])
    |> validate_required([:brand])
  end
end
