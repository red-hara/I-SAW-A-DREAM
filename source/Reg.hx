package;

import flixel.util.FlxSave;
import flixel.FlxG;
import mecha.Player;

import gameStates.*;

class Reg
{
    public static var player:Player;

	public static var health:Int = 100;
    public static var xp:Int = 4;
    public static var location:Int = 0;

    public static var events:Array<Bool> = [false, false, false, false, false, false];

    public static function getLevel(XP:Int):Int
    {
        return Math.floor(Math.log(XP));
    }

    public static function getAttack(Level:Int):Int
    {
        return Math.floor(Level * 5 * (Math.random() / 2 + .5));
    }

    public static function getDefence(Level:Int):Int
    {
        return Level * 5;
    }

    public static function save():Void
    {
        var save:FlxSave = new FlxSave();
        save.bind("ld32");
        save.data.xp = xp;
        save.data.health = health;
        save.data.x = player.x;
        save.data.y = player.y;
        save.data.location = Type.getClassName(Type.getClass(FlxG.state));
        save.data.events = events;
        save.flush();
    }

    public static function load():Void
    {
        var save:FlxSave = new FlxSave();
        save.bind("ld32");
        xp = save.data.xp;
        health = save.data.health;
        events = save.data.events;
        FlxG.switchState(Type.createInstance(Type.resolveClass(save.data.location), [save.data.x, save.data.y]));
        save.flush();
    }
}