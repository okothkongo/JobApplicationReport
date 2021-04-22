defmodule JobApplicationReport.Report do
  alias JobApplicationReport.Repo
  alias JobApplicationReport.Application.ApplicationQuery
  alias JobApplicationReport.Application.Skill

  def all_applications do
    ApplicationQuery.all_applications() |> Repo.all()
  end

  def number_of_unique_skills do
    Skill.number_of_unique_skills_query() |> Repo.one()
  end
end
