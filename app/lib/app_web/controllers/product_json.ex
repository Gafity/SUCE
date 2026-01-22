defmodule AppWeb.ProductJSON do
  alias AppWeb.Products.Product

  def show(%{product: product}) do
    %{data: data(product)}
  end

  defp data(%Product{} = product) do
    %{
      name: product.name,
      category: product.category,
      price: Decimal.to_float(product.price),
      delivery_date: product.delivery_date,
      quantity_delivered: product.quantity_delivered,
      expiration_date: product.expiration_date,
      brand: %{id: product.brand.id}
    }
  end
end
