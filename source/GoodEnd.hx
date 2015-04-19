package;

import mecha.DialogWindow;
import flixel.FlxState;
import flixel.text.FlxText;

class GoodEnd extends FlxState
{
    override public function create():Void
    {
        super.create();
        openSubState(new DialogWindow("...:\nPlease!\nI... I don't want to harm you...", "assets/images/headZom.png", girlsWords));
    }

    public function girlsWords():Void
    {
        openSubState(new DialogWindow("Girl:\nOh...", "assets/images/headGirl.png", wakeUp));
    }

    public function wakeUp():Void
    {
        var text:FlxText = new FlxText(0, 8, 320, "So I woke up.\nI don't know who is that girl. But I know: I'll meet her again.");
        text.size = 16;
        add(text);      
    }
}
