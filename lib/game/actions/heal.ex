defmodule ExMon.Game.Actions.Heal do
  alias ExMon.Game
  alias ExMon.Game.Status

  @heal_power 18..25

  def heal_hit_points(player) do
    player
    |> Game.fetch_player()
    |> Map.get(:hit_points)
    |> calculate_total_hit_points()
    |> set_hit_points(player)
  end

  defp calculate_total_hit_points(hit_points), do: Enum.random(@heal_power) + hit_points

  defp set_hit_points(hit_points, player) when hit_points > 100, do: update_player_hit_points(player, 100)
  defp set_hit_points(hit_points, player), do: update_player_hit_points(player, hit_points)

  defp update_player_hit_points(player, hit_points) do
    player
    |> Game.fetch_player()
    |> Map.put(:hit_points, hit_points)
    |> update_game(player, hit_points)
  end

  defp update_game(player_data, player, hit_points) do
    Game.info()
    |> Map.put(player, player_data)
    |> Game.update()

    Status.print_heal_message(player, :heal, hit_points)
  end
end
