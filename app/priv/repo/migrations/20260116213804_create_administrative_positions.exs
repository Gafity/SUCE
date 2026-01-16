defmodule App.Repo.Migrations.CreateAdministrativePositions do
  use Ecto.Migration

  def up do
    execute("CREATE TYPE position_enum AS ENUM ('adm', 'manager', 'employee', 'auditor')")

    create table(:administrative_positions) do
      add :employee_code, :string, null: false
      add :name, :string, null: false
      add :position, :position_enum, null: false
      add :phone_number, :string, null: false
      add :email, :string, null: false
      add :password, :string, null: false

      # Importante adicionar!
      timestamps()
    end
  end

  def down do
    drop table(:administrative_positions)
    execute("DROP TYPE position_enum")
  end
end
