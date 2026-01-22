defmodule AppWeb.ProductController do
  use AppWeb, :controller

  alias AppWeb.Products
  alias AppWeb.Products.Product

  action_fallback AppWeb.FallbackController

  def create(conn, product_params) do
    with {:ok, %Product{} = product} <- Products.create_product(product_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/products/#{product}")
      |> render(:show, product: product)
    end
  end
end
