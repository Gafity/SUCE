defmodule AppWeb.Brands do
  import Ecto.Query, warn: false
  alias App.Repo
  alias AppWeb.Brands.Brand

  def create_brand(attrs) do
    %Brand{}
    |> Brand.changeset(attrs)
    |> Repo.insert()
  end
end
