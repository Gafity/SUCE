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

  def update(conn, %{"id" => id, "brand" => brand_params}) do
    brand = Brands.get_brand!(id)

    with {:ok, %Brand{} = brand} <- Brands.update_brand(brand, brand_params) do
      render(conn, :show, brand: brand)
    end
  end

  def delete(conn, %{"id" => id}) do
    brand = Brands.get_brand!(id)

    with {:ok, %Brand{}} <- Brands.delete_brand(brand) do
      send_resp(conn, :no_content, "")
    end
  end
end
