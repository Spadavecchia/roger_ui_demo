defmodule RogerUiDemo.Web.PageControllerTest doI tried to push `ClojureScript` but I think I went too far with that
  use RogerUiDemo.Web.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
