package mecha;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSubState;
import flixel.FlxSprite;
import flixel.input.keyboard.FlxKey;

class DialogWindow extends FlxSubState
{
    public var displayText:FlxText;
    public var border:FlxSprite;

    public var printing:Bool;
    public var fast:Bool;

    public var counter:Float;

    public var message:String;
    public var charIndex:Int;

    public var callback:Void->Void;

    public function new(Message:String, HeadImage:Dynamic, Callback:Void->Void)
    {
        super();

        message = Message;
        printing = true;
        fast = false;

        counter = 0;
        charIndex = 0;

        border = new FlxSprite(0, 110);
        border.loadGraphic("assets/images/dialogBorder.png");
        border.scrollFactor.set(0, 0);
        add(border);

        displayText = new FlxText(2, 112, 320,"");
        displayText.width = 318;
        displayText.color = 0xff000000;
        displayText.scrollFactor.set(0, 0);
        add(displayText);

        var headSprite:FlxSprite = new FlxSprite(0, 0);
        headSprite.loadGraphic(HeadImage);
        headSprite.scrollFactor.set(0, 0);
        add(headSprite);

        callback = Callback;
    }

    override public function update():Void
    {
        super.update();

        if (printing)
        {
            fast = FlxG.keys.checkStatus(FlxKey.SPACE, FlxKey.PRESSED);
            counter += FlxG.elapsed;
            if (counter > ((fast) ? .001 : 0.1))
            {
                counter = 0;
                displayText.text = displayText.text + Std.string(message.charAt(charIndex++));
                if (charIndex > message.length)
                {
                    printing = false;
                }
            }
        }
        else if(FlxG.keys.checkStatus(FlxKey.SPACE, FlxKey.JUST_PRESSED))
        {
            close();
            if (callback != null)
            {
                callback();
            }
        }
    }
}