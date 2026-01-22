defmodule AppWeb.Brands do
  import Ecto.Query, warn: false
  alias App.Repo
  alias AppWeb.Brands.Brand

  def create_brand(attrs) do
    %Brand{}
    |> Brand.changeset(attrs)
    |> Repo.insert()
  end

  def get_brand!(id), do: Repo.get!(Brand, id)

  def update_brand(%Brand{} = brand, attrs) do
    brand
    |> Brand.changeset(attrs)
    |> Repo.update()
  end

  def delete_brand(%Brand{} = brand) do
    Repo.delete(brand)
  end
end
