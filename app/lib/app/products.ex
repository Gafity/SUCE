defmodule AppWeb.Products do
  import Ecto.Query, warn: false
  alias AppWeb.Products.Product
  alias App.Repo

  def get_product!(id), do: Repo.get!(Product, id)

  def create_product(attrs) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
    |> case do
      {:ok, product} -> {:ok, Repo.preload(product, :brand)}
      error -> error
    end
  end

  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
    |> case do
      {:ok, product} -> {:ok, Repo.preload(product, :brand)}
      error -> error
    end
  end

  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end
end
