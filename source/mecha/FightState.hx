package mecha;

import flixel.FlxState;
import flixel.FlxSubState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.input.keyboard.FlxKey;

class FightState extends FlxSubState
{

    public var player:FlxSprite;
    public var enemy:FlxSprite = new FlxSprite(230, 31);
    public var enemyHealth:Int = 100;
    public var enemyName:String;
    public var enemyXp:Int = 10;

    public var hpBorder:FlxSprite = new FlxSprite(0, 0);
    public var hpBarPlayer:FlxSprite = new FlxSprite(5, 168);
    public var hpBarPlayerText:FlxText = new FlxText(5, 156);
    public var hpBarEnemy:FlxSprite = new FlxSprite(35, 136);
    public var hpBarEnemyText:FlxText = new FlxText(25, 124);

    public var done:Bool = false;
    public var timer:Float = 0;

    public var runChance:Float = 0.25;

    public var defenceCounter:Int = 0;

    public function new(Enemy:Int, EnemyXP:Int)
    {
        super();
        switch (Enemy)
        {
            case 0:
                enemyName = "zombie";
                enemy.loadGraphic("assets/images/zombie.png");
            case 1:
                enemyName = "SWAT";
                enemy.loadGraphic("assets/images/swat.png");
            case 2:
                enemyName = "girl";
                enemy.loadGraphic("assets/images/girl.png");
                runChance = -1;
        }
        enemyXp = EnemyXP;
    }

    override public function create():Void
    {
        FlxG.camera.fade(0xff000000, .25, true);

        bgColor = 0xff808080;

        hpBarPlayer.makeGraphic(100, 2, 0xff000000);
        hpBarPlayer.scrollFactor.set(0, 0);
        add(hpBarPlayer);

        hpBarEnemy.makeGraphic(100, 2, 0xff000000);
        hpBarEnemy.scrollFactor.set(0, 0);
        add(hpBarEnemy);

        hpBorder.loadGraphic("assets/images/hpBorder.png");
        hpBorder.scrollFactor.set(0, 0);
        add(hpBorder);

        hpBarPlayerText.scrollFactor.set(0, 0);
        hpBarPlayerText.width = 100;
        hpBarPlayerText.color = 0xff000000;
        add(hpBarPlayerText);

        hpBarEnemyText.scrollFactor.set(0, 0);
        hpBarEnemyText.width = 100;
        hpBarEnemyText.color = 0xff000000;
        add(hpBarEnemyText);

        enemy.scrollFactor.set(0, 0);
        add(enemy);

        player = new FlxSprite(146, 54);
        player.loadGraphic("assets/images/playerFight.png");
        player.scrollFactor.set(0, 0);
        add(player);
    }

    override public function update():Void
    {
        super.update();
        if (!done)
        {
            hpBarPlayer.x = 5 - 100 + Reg.health;
            hpBarPlayerText.text = "... " + Reg.health + "/100 lvl:" + Reg.getLevel(Reg.xp);
            hpBarEnemy.x = 35 - 100 + enemyHealth;
            hpBarEnemyText.text = enemyName + " " + enemyHealth + "/100 lvl: " + Reg.getLevel(enemyXp);
            act();
            if (enemyHealth <= 0)
            {
                win();
            }
            else if (Reg.health <= 0)
            {
                lose();
            }
            else
            {
                act();
            }
        }
    }

    public function act():Void
    {
        timer += FlxG.elapsed;
        if (timer > .5)
        {
            var mode:Int = -1;
            var att:Int = 0;
            var def:Int = 0;

            var enemyAtt:Int = 0;
            var enemyDef:Int = 0;

            if (FlxG.keys.checkStatus(FlxKey.A, FlxKey.JUST_PRESSED))
            {
                mode = 0;
                att = Reg.getAttack(Reg.getLevel(Reg.xp)) * 2;
                def = 0;
            }
            if (FlxG.keys.checkStatus(FlxKey.W, FlxKey.JUST_PRESSED))
            {
                mode = 1;
                att = Math.floor(Reg.getAttack(Reg.getLevel(Reg.xp)));
                def = Math.floor(Reg.getDefence(Reg.getLevel(Reg.xp)) / 4);
            }
            if (FlxG.keys.checkStatus(FlxKey.D, FlxKey.JUST_PRESSED))
            {
                mode = 2;
                defenceCounter ++;
                att = 0;
                def = Math.floor(Reg.getDefence(Reg.getLevel(Reg.xp)) / 2);
            }
            if (FlxG.keys.checkStatus(FlxKey.S, FlxKey.JUST_PRESSED))
            {
                mode = 3;
                if (Math.random() < runChance)
                {
                    run();
                }
            }

            if (mode != -1)
            {
                if (enemyName == "girl" && defenceCounter > 10)
                {
                    FlxG.switchState(new GoodEnd());
                }

                timer = 0;
                FlxG.camera.shake(.005, .1);
                var enemyMode:Int = Math.floor(Math.random() * 3);
                switch (enemyMode)
                {
                    case 0:
                        enemyAtt = Reg.getAttack(Reg.getLevel(enemyXp));
                        enemyDef = 0;
                    case 1:
                        enemyAtt = Math.floor(Reg.getAttack(Reg.getLevel(enemyXp)) / 2);
                        enemyDef = Math.floor(Reg.getDefence(Reg.getLevel(enemyXp)) / 2);
                    case 2:
                        enemyAtt = 0;
                        enemyDef = Reg.getDefence(Reg.getLevel(enemyXp));
                    case 3:
                }
                Reg.health -= Math.floor(Math.max(0, enemyAtt - def));
                enemyHealth -= Math.floor(Math.max(0, att - enemyDef));
            }
        }
    }

    public function win():Void
    {
        if (enemyName == "girl")
        {
            FlxG.switchState(new BadEnd());
        }
        Reg.health = Math.floor(Math.min(100, Reg.health + 10));
        Reg.xp += Math.ceil(enemyXp / 2);
        done = true;
        close();
    }

    public function run():Void
    {
        done = true;
        close();
    }

    public function lose():Void
    {
        done = true;
        FlxG.switchState(new DieState());
    }
}