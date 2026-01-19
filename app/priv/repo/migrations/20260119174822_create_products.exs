defmodule App.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string, null: false
      add :category, :string, null: false
      add :price, :decimal, null: false
      add :delivery_date, :utc_datetime_usec, null: false
      add :expiration_date, :utc_datetime_usec, null: false
      add :quantity_delivered, :integer
      add :brand_id, references(:brands, on_delete: :nilify_all), null: true

      timestamps(type: :utc_datetime_usec)
    end

    create table(:products_suppliers_link, primary_key: false) do
      add :product_id, references(:products, on_delete: :delete_all), null: false

      add :supplier_id, references(:suppliers, on_delete: :delete_all), null: false
    end
  end
end
