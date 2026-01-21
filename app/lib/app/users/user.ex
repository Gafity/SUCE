defmodule AppWeb.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :employee_code, :string
    field :name, :string
    field :position, Ecto.Enum, values: [:adm, :manager, :employee, :auditor]
    field :phone_number, :string
    field :email, :string
    field :password, :string

    timestamps(type: :utc_datetime_usec)
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:employee_code, :name, :position, :phone_number, :email, :password])
    |> validate_required([:employee_code, :name, :position, :phone_number, :email, :password])
    |> validate_length(:phone_number, min: 11)
    |> validate_length(:phone_number, max: 11)
    |> validate_format(:email, ~r/@/)
  end
end
