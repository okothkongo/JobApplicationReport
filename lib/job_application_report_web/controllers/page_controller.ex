defmodule JobApplicationReportWeb.PageController do
  use JobApplicationReportWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
