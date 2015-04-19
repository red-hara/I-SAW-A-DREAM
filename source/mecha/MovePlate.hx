package mecha;

import flixel.FlxObject;
import flixel.FlxG;

class MovePlate extends FlxObject
{

    public var destX:Float;
    public var destY:Float;
    public var state:String;

    public function new(X:Float, Y:Float, State:String, DestX:Float, DestY:Float)
    {
        super(X, Y);
        width = 16;
        height = 16;

        state = State;
        destX = DestX;
        destY = DestY;
    }

    override public function update():Void
    {
        if (FlxG.overlap(this, Reg.player))
        {

            FlxG.switchState(Type.createInstance(Type.resolveClass(state), [destX, destY]));
        }
    }
}