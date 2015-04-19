package mecha;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.input.keyboard.FlxKey;

class Player extends FlxSprite
{
    public function new(X:Float, Y:Float)
    {
        super(X, Y);
        loadGraphic("assets/images/player.png", true, 16, 32);
        width = 8;
        height = 3;
        offset.set(4, 29);
        animation.add("stayE", [0]);
        animation.add("walkE", [1, 2, 3, 4], 6);
        animation.add("stayW", [5]);
        animation.add("walkW", [6, 7, 8, 9], 6);
        animation.add("stayS", [10]);
        animation.add("walkS", [11, 12, 13, 14], 6);
        animation.add("stayN", [15]);
        animation.add("walkN", [16, 17, 18, 19], 6);
        FlxG.camera.follow(this);
    }

    override public function update():Void
    {
        super.update();
        velocity.set(0, 0);
        if (FlxG.keys.checkStatus(FlxKey.D, FlxKey.PRESSED))
        {
            animation.play("walkE");
            velocity.x = 6 * 10;
            facing = FlxObject.RIGHT;
        }
        else if (FlxG.keys.checkStatus(FlxKey.A, FlxKey.PRESSED))
        {
            animation.play("walkW");
            velocity.x = -6 * 10;
            facing = FlxObject.LEFT;
        }
        else if (FlxG.keys.checkStatus(FlxKey.S, FlxKey.PRESSED))
        {
            animation.play("walkS");
            velocity.y = 6 * 10;
            facing = FlxObject.DOWN;
        }
        else if (FlxG.keys.checkStatus(FlxKey.W, FlxKey.PRESSED))
        {
            animation.play("walkN");
            velocity.y = -6 * 10;
            facing = FlxObject.UP;
        }
        else
        {
            switch (facing)
            {
                case FlxObject.RIGHT:
                    animation.play("stayE");
                case FlxObject.LEFT:
                    animation.play("stayW");
                case FlxObject.DOWN:
                    animation.play("stayS");
                case FlxObject.UP:
                    animation.play("stayN");
            }
        }
    }
}