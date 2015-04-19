package;

import flixel.FlxState;
import flixel.text.FlxText;

class BadEnd extends FlxState
{
    override public function create():Void
    {
        var text:FlxText = new FlxText(0, 8, 320, "And she never woke up again.");
        text.size = 16;        
        add(text);
    }
}