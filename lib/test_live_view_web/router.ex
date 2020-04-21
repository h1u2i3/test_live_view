defmodule TestLiveViewWeb.Router do
  use TestLiveViewWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_root_layout, {TestLiveViewWeb.LayoutView, :root}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TestLiveViewWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/app", TestLive.Index
  end

  # Other scopes may use custom stacks.
  # scope "/api", TestLiveViewWeb do
  #   pipe_through :api
  # end
end
