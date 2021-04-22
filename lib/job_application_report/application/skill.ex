defmodule JobApplicationReport.Application.Skill do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias JobApplicationReport.Application.Applicant

  schema "skills" do
    field :name, :string
    belongs_to :applicant, Applicant
  end

  def changeset(skill, params) do
    skill
    |> cast(params, [:name, :applicant_id])
  end

  def number_of_unique_skills_query do
    from s in __MODULE__, select: count(s.name, :distinct)
  end
end
