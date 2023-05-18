defmodule BackgroundProcessing.Repo.Migrations.CreateSubscribers do
  use Ecto.Migration

  def change do
    create table(:subscribers) do
      add :email, :string
      add :name, :string

      timestamps()
    end
  end
end
