defmodule CreatePlayerTest do
  use ExUnit.Case

  alias ExMon.Player

  @player %Player{
    life: 100,
    name: "Player 1",
    move_rnd: :punch,
    move_avg: :kick,
    move_heal: :cure
  }

  describe "create_player/4" do
    test "should create player when passing all correct parameters" do
      expected_result = @player

      player = ExMon.create_player("Player 1", :punch, :kick, :cure)

      assert player == expected_result
    end

    @invalid_cases [
      {"without name", [:punch, :kick, :cure]},
      {"without move_rnd", ["Player 1", :kick, :cure]},
      {"without move_avg", ["Player 1", :punch, :cure]},
      {"without move_heal", ["Player 1", :punch, :kick]}
    ]

    for {description, args} <- @invalid_cases do
      test "should raise UndefinedFunctionError when #{description}" do
        assert_raise UndefinedFunctionError,
                     ~r/function ExMon.create_player\/\d is undefined or private/,
                     fn -> apply(ExMon, :create_player, unquote(args)) end
      end
    end
  end
end
