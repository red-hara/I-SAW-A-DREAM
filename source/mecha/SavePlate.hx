package mecha;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;

class SavePlate extends FlxSprite
{
    public function new(X:Float, Y:Float)
    {
        super(X, Y);
        loadGraphic("assets/images/save.png");
    }

    override public function update():Void
    {
        if (FlxG.overlap(this, Reg.player) && FlxG.keys.checkStatus(FlxKey.SPACE, FlxKey.JUST_PRESSED))
        {
            Reg.health = Math.floor(Math.max(Reg.health, 50));
            Reg.save();
        }
    }
}