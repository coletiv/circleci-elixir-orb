defmodule CircleciOrbWeb.Router do
  use CircleciOrbWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CircleciOrbWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    resources "/posts", PostController, except: [:new, :edit]
  end
end
