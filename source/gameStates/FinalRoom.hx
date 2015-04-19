package gameStates;

import mecha.GameState;
import mecha.Player;
import mecha.MovePlate;
import mecha.EventPlate;
import mecha.FightState;
import mecha.DialogWindow;
import openfl.Assets;
import flixel.FlxSprite;
import flixel.tile.FlxTilemap;
import flixel.FlxG;

class FinalRoom extends GameState
{
    override public function create():Void
    {
        tiles = new FlxTilemap();
        tiles.loadMap(Assets.getText("assets/data/final.csv"), Assets.getBitmapData("assets/images/tiles.png"), 16, 16, 0, 0, 1, 80);
        add(tiles);

        new Room1(0,0);
        add(new MovePlate(7 * 16 + 8, 7 * 16, "gameStates.Room1", 3 * 16, 4 * 16 + 8));

        add(new EventPlate(4 * 16, 2 * 16, help, 5, "assets/images/worldGirl.png", 0, 20));

        super.create();
    }

    public function help():Void
    {
        openSubState(new DialogWindow("Girl:\nGet away from my dream!", "assets/images/headGirl.png", fight));
    }

    public function fight():Void
    {
        var fightState:FightState = new FightState(2, 1);
        fightState.create();
        openSubState(fightState);
    }
}