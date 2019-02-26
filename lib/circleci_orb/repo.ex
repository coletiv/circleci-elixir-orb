defmodule CircleciOrb.Repo do
  use Ecto.Repo,
    otp_app: :circleci_orb,
    adapter: Ecto.Adapters.Postgres
end
