defmodule RogerUiDemo.Job.CreateUpdateOwner do
  use Roger.Job
  alias RogerUiDemo.Repo
  alias RogerUiDemo.PetShop.Owner

  def perform(attrs) do
    Process.sleep(1000)
    case Repo.get_by(Owner, email: attrs["email"]) do
      nil -> %Owner{}
      user -> user
    end
    |> Owner.changeset(attrs)
    |> Repo.insert_or_update()
  end
end
