package gameStates;

import mecha.GameState;
import mecha.Player;
import mecha.MovePlate;
import mecha.EventPlate;
import mecha.SavePlate;
import mecha.FightState;
import mecha.DialogWindow;
import openfl.Assets;
import flixel.FlxSprite;
import flixel.tile.FlxTilemap;
import flixel.FlxG;

class Hall1 extends GameState
{
    override public function create():Void
    {
        tiles = new FlxTilemap();
        tiles.loadMap(Assets.getText("assets/data/hall1.csv"), Assets.getBitmapData("assets/images/tiles.png"), 16, 16, 0, 0, 1, 80);
        add(tiles);

        add(new MovePlate(15 * 16, 7 * 16 + 8, "gameStates.Room0", 5 * 16, 13 * 16));
        new Room0(0, 0);
        new Room1(0, 0);
        add(new MovePlate(2 * 16, 2 * 16 - 8, "gameStates.Room1", 13 * 16, 17 * 16));
        add(new SavePlate(7 * 16, 6 * 16));
        add(new EventPlate(2 * 16, 3 * 16, human, 4, "assets/images/worldSwat.png", 0, 20));

        super.create();
    }

    public function human():Void
    {
        openSubState(new DialogWindow("...:\nFinally, someone alive!", "assets/images/headZom.png", stay));
    }

    public function stay():Void
    {
        openSubState(new DialogWindow("SWAT:\nShit, another zombie!\nDie, bastard!", "assets/images/headSwat.png", fight));
    }

    public function fight():Void
    {
        var fightState:FightState = new FightState(1, 55);
        fightState.create();
        openSubState(fightState);
    }
}