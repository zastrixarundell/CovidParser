defmodule CovidParserWeb.Router do
  use CovidParserWeb, :router

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

  scope "/api", CovidParserWeb do
    pipe_through :api

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", CovidParserWeb do
  #   pipe_through :api
  # end
end
