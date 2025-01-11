defmodule PlayerTest do
  use ExUnit.Case

  test "should be able to create a player" do
    player = %ExMon.Player{life: 100, name: "Player 1", move_rnd: :punch, move_avg: :kick, move_heal: :cure}

    assert player.life == 100
    assert player.name == "Player 1"
    assert player.move_rnd == :punch
    assert player.move_avg == :kick
    assert player.move_heal == :cure
  end
end
