import h2d.col.Bounds;

/**
    Player entity
**/
class Player extends Entity {       
    private static inline var SPEED = 5;    

    /**
        Constructor
    **/
    public function new () {
        super ();

        var tile = h2d.Tile.fromColor(0xFF0000, 32, 32);
        Sprite = new h2d.Bitmap(tile, Main.Scene);
        Sprite.x = 100;
        Sprite.y = 100;
    }

    /**
        On update
    **/
    public override function Update (dt : Float) : Void {
        var dx = 0;
        var dy = 0;
        var sbound = Sprite.getBounds ();

        if (hxd.Key.isDown (hxd.Key.W)) {
            dy = -SPEED;
            var bound = Bounds.fromValues (Sprite.x, Sprite.y + dy, sbound.width, sbound.height);
            var bounds = Main.Level.Collide (bound);
            if (bounds == null) Move (0, dy);
        }
        if (hxd.Key.isDown (hxd.Key.S)) {
            dy = SPEED;
            var bound = Bounds.fromValues (Sprite.x, Sprite.y + dy, sbound.width, sbound.height);
            var bounds = Main.Level.Collide (bound);
            if (bounds == null) Move (0, dy);
        }
        if (hxd.Key.isDown (hxd.Key.A)) {
            dx = -SPEED;
            var bound = Bounds.fromValues (Sprite.x + dx, Sprite.y, sbound.width, sbound.height);
            var bounds = Main.Level.Collide (bound);
            if (bounds == null) Move (dx, 0);
        }
        if (hxd.Key.isDown (hxd.Key.D)) {
            dx = SPEED;
            var bound = Bounds.fromValues (Sprite.x + dx, Sprite.y, sbound.width, sbound.height);
            var bounds = Main.Level.Collide (bound);
            if (bounds == null) Move (dx, 0);
        }    
    }
}