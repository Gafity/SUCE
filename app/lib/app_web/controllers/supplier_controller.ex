defmodule AppWeb.SupplierController do
  use AppWeb, :controller

  alias AppWeb.Suppliers
  alias AppWeb.Suppliers.Supplier

  def create(conn, supplier_params) do
    with {:ok, %Supplier{} = supplier} <- Suppliers.create_supplier(supplier_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/suppliers/#{supplier}")
      |> render(:show, supplier: supplier)
    end
  end
end
