import h2d.col.Bounds;

/**
    Base entity
**/
class Entity {
    /**
        Sprite
    **/
    public var Sprite : h2d.Sprite;

    /**
        Constructor
    **/
    public function new () {}

    /**
        Return bounds of entity
    **/
    public function GetBounds () : Bounds {
        return Sprite.getBounds ();
    }

    /**
        Move entity by dx, dy
    **/
    public function Move (dx : Float, dy : Float) : Void {
        Sprite.x += dx;
        Sprite.y += dy;
    }

    /**
        On update for overrider
    **/
    public function Update (dt : Float) : Void {
    }
}