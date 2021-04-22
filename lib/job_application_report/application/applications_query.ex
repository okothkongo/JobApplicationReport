defmodule JobApplicationReport.Application.ApplicationQuery do
  import Ecto.Query
  alias JobApplicationReport.Application.Job
  alias JobApplicationReport.Application.Applicant
  alias JobApplicationReport.Application.Skill

  def all_applications do
    from j in Job,
      left_join: a in Applicant,
      on: a.job_id == j.id,
      left_join: s in Skill,
      on: s.applicant_id == a.id,
      group_by: j.id,
      order_by: j.id,
      preload: [applicants: :skills],
      select: %{j | skill_count: count(s.id)}
  end
end
