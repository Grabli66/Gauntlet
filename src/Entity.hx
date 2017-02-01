import h2d.col.Bounds;
import differ.shapes.Circle;
import h2d.Sprite;
import h2d.col.Point;

/**
    Base entity
**/
class Entity {
    /**
        Tile size
    **/
    private var _size : Int;

    /**
        Sprite
    **/
    public var Sprite : Sprite;

    /**
        Entity shape
    **/
    public var Shape (default, null) : Circle;   

    /**
        Constructor
    **/
    public function new (x : Int, y : Int, size : Int) {
        _size = size;
        Sprite = new Sprite (Game.Scene);
        Sprite.x = x;
        Sprite.y = y;
        Shape = new Circle (x + size / 2, y + size / 2, size / 2);
        Shape.data = this;
        Game.AddShape (Shape);
    }

    /**
        Return bounds of entity
    **/
    public function GetBounds () : Bounds {
        return Sprite.getBounds ();
    }

    /**
        Return center point
    **/
    public function GetCenter () : Point {
        return GetBounds ().getCenter ();        
    }

    /**
        Move entity by dx, dy
    **/
    public function Move (dx : Int, dy : Int) : Void {                
        Shape.x += dx;
        Shape.y += dy;
        var colls = Game.Collide (Shape);
        for (result in colls) {            
            Shape.x = result.shape1.position.x + result.separationX;
            Shape.y = result.shape1.position.y + result.separationY;            
        }
        Sprite.x = Shape.x - _size / 2;
        Sprite.y = Shape.y - _size / 2;
    }    

    /**
        On update for override
    **/
    public function Update (dt : Float) : Void {
    }
}