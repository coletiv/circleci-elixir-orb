defmodule CircleciOrb.Accounts.User do
  @moduledoc """
  Users
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :is_admin, :boolean, default: false
    field :name, :string
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password_hash, :is_admin])
    |> validate_required([:name, :email, :password_hash, :is_admin])
    |> unique_constraint(:email)
  end
end
