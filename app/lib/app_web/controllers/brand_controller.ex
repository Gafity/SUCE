defmodule AppWeb.BrandController do
  use AppWeb, :controller
  alias AppWeb.Brands.Brand
  alias AppWeb.Brands

  def create(conn, brand_params) do
    with {:ok, %Brand{} = brand} <- Brands.create_brand(brand_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/brands/#{brand}")
      |> render(:show, brand: brand)
    end
  end
end
