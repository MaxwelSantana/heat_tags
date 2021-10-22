defmodule HeatTagsWeb.MessagesController do
  use HeatTagsWeb, :controller

  def create(conn, params) do
    IO.inspect(params)

    text(conn, "RECEBI A REQUISIÇÃO")
  end
end
