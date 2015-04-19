package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;

class LogoState extends FlxState
{
    public var counter:Float = 0;

    override public function create():Void
    {
        super.create();
        FlxG.camera.fade(0xff000000, .25, true);
        FlxG.mouse.visible = false;

        var logo = new FlxSprite(320 / 2 - 45, 180 / 2 - 45);
        logo.loadGraphic("assets/images/logo.png");
        add(logo);
    }

    override public function update():Void
    {
        super.update();
        counter += FlxG.elapsed;
        if (counter >= 3)
        {
            FlxG.camera.fade(0xff000000, .25, false, switcher);
        }
    }

    public function switcher():Void
    {
        FlxG.switchState(new MenuState());
    }
}