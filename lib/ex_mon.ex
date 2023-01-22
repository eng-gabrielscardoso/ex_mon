defmodule ExMon do
  alias ExMon.{Game, Player}
  alias ExMon.Game.{Actions, Status}

  @enemies_names ["Robotinik", "Super-globalist", "Iphone Socialist", "Marx Lover"]

  def create_player(move_average, move_heal, move_special, name) do
    Player.create(move_average, move_heal, move_special, name)
  end

  def start_game(player) do
    create_player(:punch, :cure, :super_punch, @enemies_names |> Enum.shuffle |> hd)
    |> Game.start(player)

    Status.print_round_message(Game.info())
  end

  def make_move(move) do
    move
    |> Actions.fetch_move()
    |> do_move()
  end

  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)
  defp do_move({:ok, move}) do
    case move do
      :move_heal -> Actions.heal(move)
      _ -> Actions.attack(move)
    end

    Status.print_round_message(Game.info())
  end
end
