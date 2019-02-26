defmodule CircleciOrb.Factory do
  @moduledoc """
  Default mocks objects
  """
  # with Ecto
  use ExMachina.Ecto, repo: CircleciOrb.Repo

  def user_factory do
    %CircleciOrb.Accounts.User{
      name: "Jane Smith",
      email: sequence(:email, &"email-#{&1}@example.com"),
      is_admin: false,
      password_hash: Bcrypt.hash_pwd_salt("12345678")
    }
  end

  def post_factory do
    %CircleciOrb.Posts.Post{
      title: sequence(:title, &"Title-#{&1}"),
      content: sequence(:title, &"Content-#{&1}"),
      user: build(:user)
    }
  end
end
