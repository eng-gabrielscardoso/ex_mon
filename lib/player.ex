defmodule ExMon.Player do
  @hit_points 100
  @required_keys [:hit_points, :moves, :name]

  @enforce_keys @required_keys
  defstruct @required_keys

  def create(move_average, move_heal, move_special, name) do
    %ExMon.Player{
      hit_points: @hit_points,
      moves: %{
        move_average: move_average,
        move_heal: move_heal,
        move_special: move_special,
      },
      name: name,
    }
  end
end
