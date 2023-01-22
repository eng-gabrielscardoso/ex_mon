defmodule ExMon.Game.Actions.Attack do
  alias ExMon.Game
  alias ExMon.Game.Status

  @move_average_power 18..25
  @move_special_power 10..35

  def attack_opponent(opponent, move) do
    damage = calculate_power(move)

    opponent
    |> Game.fetch_player()
    |> Map.get(:hit_points)
    |> calculate_total_hit_points(damage)
    |> update_opponent_hit_points(opponent, damage)
  end

  defp calculate_power(:move_average), do: Enum.random(@move_average_power)
  defp calculate_power(:move_special), do: Enum.random(@move_special_power)

  defp calculate_total_hit_points(hit_points, damage) when hit_points - damage < 0, do: 0
  defp calculate_total_hit_points(hit_points, damage), do: hit_points - damage

  defp update_opponent_hit_points(hit_points, opponent, damage) do
    opponent
    |> Game.fetch_player()
    |> Map.put(:hit_points, hit_points)
    |> update_game(opponent, damage)
  end

  defp update_game(player, opponent, damage) do
    Game.info()
    |> Map.put(opponent, player)
    |> Game.update()

    Status.print_move_message(opponent, :attack, damage)
  end
end
