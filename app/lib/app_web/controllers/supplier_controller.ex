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

  def update(conn, %{"id" => id, "supplier" => supplier_params}) do
    supplier = Suppliers.get_supplier!(id)

    with {:ok, %Supplier{} = supplier} <- Suppliers.update_supplier(supplier, supplier_params) do
      render(conn, :show, supplier: supplier)
    end
  end

  def delete(conn, %{"id" => id}) do
    supplier = Suppliers.get_supplier!(id)

    with {:ok, %Supplier{}} <- Suppliers.delete_supplier(supplier) do
      send_resp(conn, :no_content, "")
    end
  end
end
