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

class Room1 extends GameState
{
    override public function create():Void
    {
        tiles = new FlxTilemap();
        enemies = [0, 1];
        enemiesXp = [10, 55];
        tiles.loadMap(Assets.getText("assets/data/room1.csv"), Assets.getBitmapData("assets/images/tiles.png"), 16, 16, 0, 0, 1, 80);
        add(tiles);

        new Hall1(0, 0);
        new FinalRoom(0, 0);
        add(new MovePlate(14 * 16 + 8, 17 * 16, "gameStates.Hall1", 2*16, 3 * 16));
        add(new MovePlate(2 * 16 - 8, 4 * 16, "gameStates.FinalRoom", 6*16, 7*16));

        add(new SavePlate(7 * 16, 11 * 16));
        add(new EventPlate(3 * 16, 5 * 16, floppy, 2, null, 0, 0));

        super.create();
    }

    public function floppy():Void
    {
        openSubState(new DialogWindow("...:\nWhat a nice floppy disk!\nI wonder, what would happen if I had keyboard and could press SPACE while standing on such floppy...", "assets/images/headZom.png", null));
    }
}