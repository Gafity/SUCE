defmodule AppWeb.Products do
  import Ecto.Query, warn: false
  alias AppWeb.Products.Product
  alias App.Repo

  def create_product(attrs) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
    |> case do
      {:ok, product} -> {:ok, Repo.preload(product, :brand)}
      error -> error
    end
  end
end
