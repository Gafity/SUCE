defmodule AppWeb.BrandJSON do
  alias AppWeb.Brands.Brand

  def show(%{brand: brand}) do
    %{data: data(brand)}
  end

  defp data(%Brand{} = brand) do
    %{
      brand: brand.brand
    }
  end
end
