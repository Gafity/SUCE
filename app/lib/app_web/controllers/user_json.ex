defmodule AppWeb.UserJSON do
  alias AppWeb.Users.User

  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%User{} = user) do
    %{
      employee_code: user.employee_code,
      name: user.name,
      user_position: user.position,
      phone_number: user.phone_number,
      email: user.email,
      password: user.password
    }
  end
end
