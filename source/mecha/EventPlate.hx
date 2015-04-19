package mecha;

import flixel.FlxSprite;
import flixel.FlxG;

class EventPlate extends FlxSprite
{
    public var num:Int;
    public var callback:Void->Void;

    public function new(X:Float, Y:Float, Callback:Void->Void, Num:Int, Image:Dynamic, OffsetX:Float, OffsetY:Float)
    {
        super(X, Y);
        if (Image != null)
        {
            loadGraphic(Image);
        }
        else
        {
            makeGraphic(16, 16, 0x00000000);
        }
        width = 16;
        height = 16;
        offset.set(OffsetX, OffsetY);
        callback = Callback;
        num = Num;
        visible = !Reg.events[num];
    }

    override public function update():Void
    {
        if (FlxG.overlap(this, Reg.player) && !Reg.events[num])
        {
            Reg.events[num] = true;
            callback();
            visible = false;
        }
    }
}