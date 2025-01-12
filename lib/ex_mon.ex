defmodule ExMon do
  alias ExMon.Player

  def create_player(name, move_rnd, move_avg, move_heal) do
    %Player{
      life: 100,
      name: name,
      move_rnd: move_rnd,
      move_avg: move_avg,
      move_heal: move_heal
    }
  end
end
