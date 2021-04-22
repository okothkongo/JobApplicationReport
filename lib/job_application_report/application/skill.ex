defmodule JobApplicationReport.Application.Skill do
  use Ecto.Schema
  import Ecto.Changeset
  alias JobApplicationReport.Application.Applicant
  schema "skills" do
    field :name, :string
    belongs_to :applicant, Applicant
  end

  def changeset(skill, params) do
    skill
    |> cast(params, [:name, :applicant_id])
  end
end
