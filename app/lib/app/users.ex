defmodule AppWeb.Users do
  import Ecto.Query, warn: false
  alias App.Repo
  alias AppWeb.Users.User

  def create_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
