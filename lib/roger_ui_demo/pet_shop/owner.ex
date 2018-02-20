defmodule RogerUiDemo.PetShop.Owner do
  use Ecto.Schema
  import Ecto.Changeset
  alias RogerUiDemo.PetShop.Owner


  schema "petshop_owners" do
    field :bio, :string
    field :email, :string
    field :name, :string
    field :number_of_pets, :integer

    timestamps()
  end

  @doc false
  def changeset(%Owner{} = owner, attrs) do
    owner
    |> cast(attrs, [:name, :email, :bio, :number_of_pets])
    |> validate_required([:name, :email, :bio, :number_of_pets])
  end
end
