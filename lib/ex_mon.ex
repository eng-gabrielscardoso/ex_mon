defmodule ExMon do
  alias ExMon.Player
  def create_player(move_average, move_heal, move_special, name) do
    Player.create(move_average, move_heal, move_special, name)
  end
end
