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
        _collideResult = new Results<ShapeCollision> (0);

        Scene = s2d;

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

    static function main () {
        hxd.Res.initEmbed();
        new Game ();
    }
}
