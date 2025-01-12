defmodule PlayerTest do
  use ExUnit.Case

  test "should be able to create a player" do
    expected_result = %ExMon.Player{
      life: 100,
      name: "Player 1",
      move_rnd: :punch,
      move_avg: :kick,
      move_heal: :cure
    }

    player = ExMon.Player.build("Player 1", :punch, :kick, :cure)

    assert player == expected_result
  end

  @required_keys [:life, :name, :move_rnd, :move_avg, :move_heal]
  Enum.each(@required_keys, fn key ->
    test "should raise exception when #{inspect(key)} key is not passed" do
      incomplete_attrs =
        Map.delete(
          %{life: 100, name: "Player 1", move_rnd: :punch, move_avg: :kick, move_heal: :cure},
          unquote(key)
        )

      assert_raise ArgumentError,
                   ~r/the following keys must also be given when building struct ExMon.Player/,
                   fn ->
                     struct!(ExMon.Player, incomplete_attrs)
                   end
    end
  end)
end
