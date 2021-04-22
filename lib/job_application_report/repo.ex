defmodule JobApplicationReport.Repo do
  use Ecto.Repo,
    otp_app: :job_application_report,
    adapter: Ecto.Adapters.Postgres
end
