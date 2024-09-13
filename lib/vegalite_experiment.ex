defmodule VegaliteExperiment do
  @moduledoc """
  Documentation for `VegaliteExperiment`.
  """
  alias VegaLite, as: Vl

  @doc """
  Hello world.

  ## Examples

      iex> VegaliteExperiment.hello()
      :world

  """

  def hello do
    y = for _ <- 1..20, do:  Enum.random(1..100)

    Vl.new(width: 400, height: 400)
    |> Vl.data_from_values(x: 1..20, y: y)
    |> Vl.mark(:bar)
    |> Vl.encode_field(:x, "x", type: :quantitative)
    |> Vl.encode_field(:y, "y", type: :quantitative)
    |> Vl.Export.to_png()
    |> then(& File.write!("test.png", &1))

    :world
  end
end
