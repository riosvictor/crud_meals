defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.User

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_fields [:description, :date, :calories, :user_id]

  @derive {Jason.Encoder, only: [:id, :description, :date, :calories, :user_id]}

  schema "meals" do
    field(:description, :string)
    field(:date, :naive_datetime)
    field(:calories, :float)

    belongs_to(:user, User, foreign_key: :user_id, type: :binary_id)

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
