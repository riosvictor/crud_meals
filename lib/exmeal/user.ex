defmodule Exmeal.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.Meal

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_fields [:name, :email, :cpf]

  @derive {Jason.Encoder, only: [:id] ++ @required_fields}

  schema "users" do
    field(:name, :string)
    field(:cpf, :string)
    field(:email, :string)

    has_many(:meals, Meal)

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:cpf, is: 11)
    |> validate_format(:email, ~r/@/)
  end
end
