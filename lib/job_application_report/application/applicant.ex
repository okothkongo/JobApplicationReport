defmodule JobApplicationReport.Application.Applicant do
  use Ecto.Schema
  import Ecto.Changeset
  alias JobApplicationReport.Application.Skill
  alias JobApplicationReport.Application.Job
  schema "applicants" do
    field :name, :string
    field :email, :string
    field :website, :string
    field :cover_letter, :string
    field :skill_count, :integer, virtual: true
    belongs_to :job, Job
    has_many :skills, Skill

  end

  def changeset(applicant, params) do
    applicant
    |> cast(params, [:name, :email, :website, :cover_letter, :job_id, :skill_count])
    |> unique_constraint(:email)
  end
end
