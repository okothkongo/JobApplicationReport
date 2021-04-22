defmodule JobApplicationReportWeb.PageView do
  use JobApplicationReportWeb, :view

  def first_applicant(applications) do
    hd(applications.applicants)
  end

  def skill_of_first_applicant(job) do
    hd(first_applicant(job).skills).name
  end

  def first_applicant_name(job) do
    hd(job.applicants).name
  end

  def rest_of_first_applicant_skills(job) do
    tl(first_applicant(job).skills)
  end

  def rest_of_applicants(job) do
    tl(job.applicants)
  end

  def skill_of_first_of_remaining_applicants(applicant) do
    hd(applicant.skills).name
  end

  def rest_of_skills(applicant) do
    tl(applicant.skills)
  end

  def no_of_applicant_skills(skills) do
    Enum.count(skills)
  end

  def number_of_applicant(applications) do
    applications
    |> Enum.reduce(0, fn appl, acc ->
      acc + Enum.count(appl.applicants)
    end)
  end
end
