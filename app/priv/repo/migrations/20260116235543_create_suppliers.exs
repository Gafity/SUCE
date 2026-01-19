defmodule App.Repo.Migrations.CreateSuppliers do
  use Ecto.Migration

  def change do
    create table(:suppliers) do
      add :name, :string, null: false
      add :total_products_supplied, :string, null: false

      timestamps(type: :utc_datetime_usec)
    end
  end
end
