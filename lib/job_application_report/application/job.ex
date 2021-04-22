defmodule JobApplicationReport.Application.Job do
  use Ecto.Schema
  import Ecto.Changeset
  alias JobApplicationReport.Application.Applicant
  schema "jobs" do
    field :name, :string
    field :skill_count, :integer, virtual: true
    has_many :applicants, Applicant
  end

  def changeset(job, params) do
    job
    |> cast(params, [:name, :skill_count])
    |> unique_constraint(:name)
  end
end
