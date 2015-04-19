package gameStates;

import mecha.GameState;
import mecha.Player;
import mecha.MovePlate;
import mecha.SavePlate;
import mecha.EventPlate;
import mecha.FightState;
import mecha.DialogWindow;
import openfl.Assets;
import flixel.FlxSprite;
import flixel.tile.FlxTilemap;
import flixel.FlxG;

class Room0 extends GameState
{
    override public function create():Void
    {
        tiles = new FlxTilemap();
        enemies = [0];
        enemiesXp = [5];
        tiles.loadMap(Assets.getText("assets/data/room0.csv"), Assets.getBitmapData("assets/images/tiles.png"), 16, 16, 0, 0, 1, 80);
        add(tiles);

        new Hall0(0, 0);
        new Hall1(0, 0);
        add(new MovePlate(1 * 16 - 8, 5 * 16, "gameStates.Hall0", 15*16, 5 * 16));
        add(new MovePlate(5 * 16, 12 * 16 - 8, "gameStates.Hall1", 15*16, 7*16));

        add(new SavePlate(3 * 16, 5 * 16));
        add(new EventPlate(3 * 16, 5 * 16, floppy, 2, null, 0, 0));

        super.create();
    }

    public function floppy():Void
    {
        openSubState(new DialogWindow("...:\nWhat a nice floppy disk!\nI wonder, what could happen if I had keyboard and could press SPACE while standing on such floppy...", "assets/images/headZom.png", null));
    }
}