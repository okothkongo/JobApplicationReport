defmodule JobApplicationReportWeb.PageController do
  use JobApplicationReportWeb, :controller
  alias JobApplicationReport.Report

  def index(conn, _params) do
    render(conn, "index.html",
      applications: applications(),
      number_of_unique_skills: number_of_unique_skills()
    )
  end

  defp applications do
    Report.all_applications()
  end

  defp number_of_unique_skills do
    Report.number_of_unique_skills()
  end
end
