defmodule App.Repo.Migrations.CreateSuppliers do
  use Ecto.Migration

  def up do
    create table(:suppliers) do
      add :name, :string, null: false
      add :total_products_supplied, :string, null: false

      timestamps(type: :utc_datetime)
    end
  end

  def down do
    drop table(:suppliers)
  end
end
