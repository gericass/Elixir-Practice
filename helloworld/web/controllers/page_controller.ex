defmodule Helloworld.PageController do
  use Helloworld.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
