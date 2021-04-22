# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     JobApplicationReport.Repo.insert!(%JobApplicationReport.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias JobApplicationReport.Repo
alias JobApplicationReport.Application.Job
alias JobApplicationReport.Application.Applicant
alias JobApplicationReport.Application.Skill
json_file = "priv/data.json"

with {:ok, file_content} <- File.read(json_file),
     {:ok,
      %{
        applicants: applicants,
        jobs: jobs,
        skills: skills
      }} <- Jason.decode(file_content, keys: :atoms) do
  Enum.each(jobs, fn %{id: id, name: name} -> Repo.insert!(%Job{name: name, id: id}) end)
  IO.inspect("jobs sucessfully created")

  Enum.each(applicants, fn %{
                             id: id,
                             name: name,
                             email: email,
                             website: website,
                             cover_letter: cover_letter,
                             job_id: job_id
                           } ->
    Repo.insert!(%Applicant{
      id: id,
      name: name,
      email: email,
      website: website,
      cover_letter: cover_letter,
      job_id: job_id
    })
  end)

  IO.inspect("applicants sucessfully created")

  Enum.each(skills, fn %{id: id, name: name, applicant_id: applicant_id} ->
    Repo.insert!(%Skill{id: id, name: name, applicant_id: applicant_id})
  end)

  IO.inspect("applicants sucessfully created")
else
  error ->
    IO.inspect(error)
end
