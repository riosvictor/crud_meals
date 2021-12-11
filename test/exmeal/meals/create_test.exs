defmodule Exmeal.Meals.CreateTest do
  use Exmeal.DataCase

  describe "Create Meal" do
    test "when all params are valid, returns the meal" do
      params = %{
        calories: 20,
        date: ~N[2001-05-02 00:00:00],
        description: "Banana"
      }

      response = Exmeal.create_meal(params)

      assert {:ok,
              %Exmeal.Meal{
                calories: 20.0,
                date: ~N[2001-05-02 00:00:00],
                description: "Banana",
                id: _id
              }} = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        calories: 20.0,
        date: ~N[2001-05-02 00:00:00]
      }

      response = Exmeal.create_meal(params)

      assert {:error, %Exmeal.Error{}} = response
    end
  end
end
