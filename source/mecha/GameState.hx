package mecha;

import flixel.FlxState;
import flixel.tile.FlxTilemap;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;

class GameState extends FlxState
{
    public var tiles:FlxTilemap;
    public var player:Player;
    public var enemies:Array<Int> = [];
    public var enemiesXp:Array<Int> = [];

    public var counter:Float = 0;

    public var playerX:Float;
    public var playerY:Float;

    public function new(X:Float, Y:Float)
    {
        super();
        playerX = X;
        playerY = Y;
    }

    override public function create():Void
    {
        bgColor = 0xff000000;

        player = new Player(playerX, playerY);
        add(player);
        Reg.player = player;

        
    }

    override public function update():Void
    {
        super.update();
        if (tiles != null)
        {
            FlxG.collide(player, tiles);
        }

        if (player.velocity.x != 0 || player.velocity.y != 0)
        {
            counter += Math.random() * FlxG.elapsed;
        }

        if (counter > 1 && enemies.length > 0)
        {
            counter = 0;

            var i:Float = Math.random();

            var fightState:FightState = new FightState(enemies[Math.floor(enemies.length * i)], enemiesXp[Math.floor(enemies.length * i)]);
            fightState.create();
            openSubState(fightState);
        }
    }
}