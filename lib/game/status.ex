defmodule ExMon.Game.Status do
  def print_round_message(%{status: :started} = info) do
    IO.puts("=============The game is started=============")
    IO.inspect(info)
  end
  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("=============It's #{player} turn=============")
    IO.inspect(info)
  end
  def print_round_message(%{status: :game_over, turn: player} = info) do
    IO.puts("=============The game is over. `#{player}` Victory=============")
    IO.inspect(info)
  end

  def print_wrong_move_message(move) do
    IO.puts("=============Invalid move: #{move}=============")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("=============The Player attacked the PC dealing #{damage} damage.=============")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("=============The PC attacked the Player dealing #{damage} damage.=============")
  end

  def print_heal_message(player, :heal, hit_points) do
    IO.puts("=============The #{player} healed itself with #{hit_points} points.=============")
  end
end
