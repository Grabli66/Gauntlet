import differ.Collision;
import differ.math.Vector in V;
import differ.shapes.*;
import differ.data.*;

/**
    Main game class
**/
class Game extends hxd.App {
    /**
        Player
    **/
    public static var Player : Player;    

    /**
        Enemies
    **/
    public static var Enemies : Array<Entity>;

    /**
        Current game level
    **/
    public static var Level : Level;

    /**
        Current scene
    **/
    public static var Scene : h2d.Scene;

    /**
        Collision shapes
    **/
    private static var _shapes : Array<Shape>;

    /**
        Collide result
    **/
    private static var _collideResult : Results<ShapeCollision>;

    /**
        On app init
    **/
    override function init () {
        _shapes = new Array<Shape> ();
        Enemies = new Array<Entity> ();
        _collideResult = new Results<ShapeCollision> (0);

        Scene = s2d;
        
        Level = new Level ();

        Enemies.push (new Ghost (300, 300));
        Enemies.push (new Ghost (500, 300));
        Enemies.push (new Ghost (700, 300));

        Player = new Player (100, 100);
    }

    /**
        On app update
    **/
    override function update (dt:Float) {
        Player.Update (dt);
        for (e in Enemies) {
            e.Update (dt);
        }
	}

    /**
        Add collision shape
    **/
    public static function AddShape (shape : Shape) : Void {
        _shapes.push (shape);
    }   

    /**
        Check collide
    **/
    public static function Collide (shape : Shape) : Results<ShapeCollision> {
        return Collision.shapeWithShapes (shape, _shapes, _collideResult);
    }

    /**
        Remove enemy, add score
    **/
    public static function RemoveEnemy (enemy : Enemy) {
        Enemies.remove (enemy);
        _shapes.remove (enemy.Shape);
    }

    static function main () {
        hxd.Res.initEmbed();
        new Game ();
    }
}
