defmodule ExMon do
  alias ExMon.Game
  alias ExMon.Player

  @enemies_names ["Robotinik", "Super-globalist", "Iphone Socialist", "Marx Lover"]

  def create_player(move_average, move_heal, move_special, name) do
    Player.create(move_average, move_heal, move_special, name)
  end

  def start_game(player) do
    @enemies_names
    |> Enum.shuffle
    |> hd
    |> create_player(:punch, :cure, :super_punch)
    |> Game.start(player)
  end
end
