package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.input.keyboard.FlxKey;
import gameStates.StartState;

class DieState extends FlxState
{

    override public function create():Void
    {
        super.create();

        var title:FlxText = new FlxText(0, 8, 320, "HE NEVER WOKE UP");
        title.size = 16;
        title.alignment = "center";
        add(title);

        var instructions:FlxText = new FlxText(0, 60, 320, "SPACE to load");
        instructions.size = 16;
        instructions.alignment = "center";
        add(instructions);
    }

    override public function destroy():Void
    {
        super.destroy();
    }

    override public function update():Void
    {
        super.update();
        if (FlxG.keys.checkStatus(FlxKey.SPACE, FlxKey.JUST_PRESSED))
        {
            Reg.load();
        }
    }   
}