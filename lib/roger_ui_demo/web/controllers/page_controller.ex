defmodule RogerUiDemo.Web.PageController do
  use RogerUiDemo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create_or_update(conn, %{"email" => email} = params) when email != "" do
    Enum.each(1..1000, fn(i) ->
      attrs =
        params
        |> Map.take(~w(name email bio))
        |> Map.put("number_of_pets", i)

      {:ok, job} = Roger.Job.create(RogerUiDemo.Job.CreateUpdateOwner, attrs)
      Roger.Job.enqueue(job, "roger_ui_demo_partition", :default)
    end)
    text conn, "OK"
  end
  def create_or_update(conn, _params), do: text conn, "Idle"
end
