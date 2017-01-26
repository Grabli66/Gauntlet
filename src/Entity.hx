import h2d.col.Bounds;

/**
    Base entity
**/
class Entity {
    /**
        Sprite
    **/
    public var Sprite : h2d.Bitmap;

    /**
        Constructor
    **/
    public function new (x : Int, y : Int) {
        Sprite = new h2d.Bitmap (null, Game.Scene);
        Sprite.x = x;
        Sprite.y = y;
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
        // check collision and roll back move
        var pos = Game.CollideGrid.Move (dx, dy, GetBounds ().toIBounds ());
        Sprite.x += pos.dx;
        Sprite.y += pos.dy;
    }

    /**
        On update for override
    **/
    public function Update (dt : Float) : Void {
    }
}