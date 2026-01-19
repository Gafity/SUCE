defmodule App.Repo.Migrations.CreateBrands do
  use Ecto.Migration

  def change do
    create table(:brands) do
      add :brand, :string

      timestamps(type: :utc_datetime)
    end
  end
end
