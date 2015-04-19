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

class Hall0 extends GameState
{
    override public function create():Void
    {
        tiles = new FlxTilemap();
        tiles.loadMap(Assets.getText("assets/data/hall0.csv"), Assets.getBitmapData("assets/images/tiles.png"), 16, 16, 0, 0, 1, 80);
        add(tiles);

        add(new MovePlate(3 * 16, 7 * 16 + 8, "gameStates.StartState", 64, 56));
        new Room0(0,0);
        add(new MovePlate(16 * 16 + 8, 5 * 16, "gameStates.Room0", 2 * 16, 5 * 16));
        add(new EventPlate(15 * 16, 5 * 16, rawr, 1, "assets/images/worldZombie.png", 24, 20));

        super.create();
    }

    public function rawr():Void
    {
        openSubState(new DialogWindow("Zombie:\nRGHRH...", "assets/images/headZombie.png", fight));
    }

    public function fight():Void
    {
        var fightState:FightState = new FightState(0, 4);
        fightState.create();
        openSubState(fightState);
    }
}