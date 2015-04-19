package gameStates;

import mecha.GameState;
import mecha.Player;
import mecha.SavePlate;
import mecha.MovePlate;
import mecha.DialogWindow;
import openfl.Assets;
import flixel.FlxSprite;
import flixel.tile.FlxTilemap;
import flixel.FlxG;

class StartState extends GameState
{
    override public function create():Void
    {
        bgColor = 0xff808080;

        tiles = new FlxTilemap();
        tiles.loadMap(Assets.getText("assets/data/start.csv"), Assets.getBitmapData("assets/images/tiles.png"), 16, 16, 0, 0, 1, 80);
        add(tiles);
        Type.getClassName(Type.getClass(new Hall0(0, 0)));
        add(new MovePlate(4 * 16, 2 * 16 - 8, "gameStates.Hall0", 3*16, 6*16));

        if (!Reg.events[0])
        {
            Reg.events[0] = true;
            openSubState(new DialogWindow("...:\nOh...\nMy head...\n\nSPACE to advance.", "assets/images/headZom.png", secondDialog));
        }

        super.create();
        Reg.save();
    }

    public function secondDialog():Void
    {
        openSubState(new DialogWindow("...:\nWhere am I?\n\nWASD to move.", "assets/images/headZom.png", null ));
    }
}