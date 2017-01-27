import h2d.col.Bounds;
import differ.shapes.Circle;

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
    public var Sprite : h2d.Bitmap;

    /**
        Entity shape
    **/
    public var Shape (default, null) : Circle;   

    private var _debug : h2d.Graphics;

    /**
        Constructor
    **/
    public function new (x : Int, y : Int, size : Int) {
        _size = size;
        Sprite = new h2d.Bitmap (null, Game.Scene);
        Sprite.x = x;
        Sprite.y = y;
        Shape = new Circle (x + size / 2, y + size / 2, size / 2);
        Game.AddShape (Shape);

        _debug = new h2d.Graphics (Game.Scene);
    }

    /**
        Return bounds of entity
    **/
    public function GetBounds () : Bounds {
        return Sprite.getBounds ();
    }

    /**
        Move entity by dx, dy
    **/
    public function Move (dx : Int, dy : Int) : Void {                
        Shape.x += dx;
        Shape.y += dy;
        var colls = Game.Collide (Shape);
        for (result in colls) {
            //if ((result.shape1 != Shape) && (result.shape2 != Shape)) continue;            
            Shape.x = result.shape1.position.x + result.separationX;
            Shape.y = result.shape1.position.y + result.separationY;            
        }
        Sprite.x = Shape.x - _size / 2;
        Sprite.y = Shape.y - _size / 2;

        /*_debug.clear ();
        _debug.lineStyle (1, 0xFF0000);
        _debug.drawCircle (Shape.x, Shape.y, _size / 2, 30);*/
    }

    /**
        On update for override
    **/
    public function Update (dt : Float) : Void {
    }
}