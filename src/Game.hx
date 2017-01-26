import h2d.col.Bounds;

/**
    Main game class
**/
class Game extends hxd.App {    
    public static var CollideGrid : CollisionGrid;

    /**
        Player
    **/
    public static var Player : Player;    

    /**
        Current game level
    **/
    public static var Level : Level;

    /**
        Current scene
    **/
    public static var Scene : h2d.Scene;    

    /**
        Enemy
    **/
    public static var Ghost : Ghost;

    /**
        On app init
    **/
    override function init () {
        Scene = s2d;        
        CollideGrid = new CollisionGrid (100, 100, 32);

        Player = new Player (100, 100);
        Ghost = new Ghost (500, 200);
        Level = new Level ();
    }

    /**
        On app update
    **/
    override function update (dt:Float) {		
        Player.Update (dt);
        Ghost.Update (dt);
	}

    static function main () {
        hxd.Res.initEmbed();
        new Game ();
    }
}
