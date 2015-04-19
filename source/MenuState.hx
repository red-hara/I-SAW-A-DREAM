package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.input.keyboard.FlxKey;
import gameStates.StartState;

class MenuState extends FlxState
{

	override public function create():Void
	{
		super.create();

		var title:FlxText = new FlxText(0, 8, 320, "I SAW A DREAM");
		title.size = 32;
		title.alignment = "center";
		add(title);

		var instructions:FlxText = new FlxText(0, 60, 320, "A+D to start\nSPACE to load");
		instructions.size = 16;
		instructions.alignment = "center";
		add(instructions);

		FlxG.mouse.visible = false;
		FlxG.sound.playMusic("assets/music/recording.wav");
		FlxG.worldBounds.set(0, 0, -1, -1);
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
		if (FlxG.keys.checkStatus(FlxKey.A, FlxKey.PRESSED) && FlxG.keys.checkStatus(FlxKey.D, FlxKey.PRESSED))
		{
			FlxG.switchState(new StartState(48, 96));
		}
		if (FlxG.keys.checkStatus(FlxKey.SPACE, FlxKey.JUST_PRESSED))
		{
			Reg.load();
		}
	}	
}