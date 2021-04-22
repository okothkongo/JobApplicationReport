defmodule JobApplicationReport.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    create table("jobs") do
      add :name, :string
    end

    create table("applicants") do
      add :name, :string
      add :email, :string
      add :website, :string
      add :cover_letter, :text
      add :job_id, references(:jobs)
    end

    create table("skills") do
      add :name, :string
      add :applicant_id, references(:applicants)
    end

    create unique_index(:jobs, [:name])
    create unique_index(:applicants, [:email])
  end
end
