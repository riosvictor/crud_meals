defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_fields [:description, :date, :calories]

  @derive {Jason.Encoder, only: [:id, :description, :date, :calories]}

  schema "meals" do
    field(:description, :string)
    field(:date, :naive_datetime)
    field(:calories, :float)

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:description, min: 5)
    |> validate_number(:calories, greater_than: 0)
  end
end
