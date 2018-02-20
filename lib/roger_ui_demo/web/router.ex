defmodule RogerUiDemo.Web.Router do
  use RogerUiDemo.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :roger do
    plug :accepts, ["html"]
    plug :put_secure_browser_headers
    plug RogerUi.Web.RouterPlug, namespace: "roger"
  end

  scope "/roger", RogerUi.Web.RouterPlug do
    pipe_through :roger
    forward "/", Router, namespace: "roger"
  end

  scope "/", RogerUiDemo.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/", PageController, :create_or_update
  end

  # Other scopes may use custom stacks.
  # scope "/api", RogerUiDemo.Web do
  #   pipe_through :api
  # end
end
