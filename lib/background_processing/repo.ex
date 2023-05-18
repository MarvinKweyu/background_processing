defmodule BackgroundProcessing.Repo do
  use Ecto.Repo,
    otp_app: :background_processing,
    adapter: Ecto.Adapters.Postgres
end
