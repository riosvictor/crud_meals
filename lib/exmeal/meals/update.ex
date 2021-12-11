defmodule Exmeal.Meals.Update do
  alias Exmeal.{Error, Meal, Repo}

  def call(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_meal_not_found_error()}
      user -> do_update(user, params)
    end
  end

  defp do_update(user, params) do
    user
    |> Meal.changeset(params)
    |> Repo.update()
  end
end
