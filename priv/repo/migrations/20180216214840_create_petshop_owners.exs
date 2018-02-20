defmodule RogerUiDemo.Repo.Migrations.CreatePetshopOwners do
  use Ecto.Migration

  def change do
    create table(:petshop_owners) do
      add :name, :string
      add :email, :string
      add :bio, :string
      add :number_of_pets, :integer

      timestamps()
    end

  end
end
