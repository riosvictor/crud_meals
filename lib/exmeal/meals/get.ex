defmodule Exmeal.Meals.Get do
  alias Exmeal.{Error, Meal, Repo}

  def by_id2(id) do
    with %Meal{} = meal <-
           Repo.get(Meal, id) do
      {:ok, meal}
    else
      nil -> {:error, Error.build_meal_not_found_error()}
    end
  end

  def by_id(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_meal_not_found_error()}
      user -> {:ok, user}
    end
  end
end
