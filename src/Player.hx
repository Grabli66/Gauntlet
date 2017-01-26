import h2d.col.Bounds;

/**
    Player entity
**/
class Player extends Entity {
    /**
        Move speed
    **/
    private static inline var SPEED = 5;    

    /**
        Constructor
    **/
    public function new (x : Int, y : Int) {
        super (x, y);        
        Sprite.tile = h2d.Tile.fromColor(0xFF0000, 32, 32);
    }

    /**
        On update
    **/
    public override function Update (dt : Float) : Void {
        var dx : Int = 0;
        var dy : Int = 0;
        var sbound = Sprite.getBounds ().toIBounds ();

        if (hxd.Key.isDown (hxd.Key.W)) {
            dy = -SPEED;            
        }
        if (hxd.Key.isDown (hxd.Key.S)) {
            dy = SPEED;
        }
        if (hxd.Key.isDown (hxd.Key.A)) {
            dx = -SPEED;
        }
        if (hxd.Key.isDown (hxd.Key.D)) {
            dx = SPEED;
        }
                
        Move (dx, dy);

        /*if (hxd.Key.isDown (hxd.Key.W)) {
            dy = -SPEED;
            var bound = Bounds.fromValues (Sprite.x, Sprite.y + dy, sbound.width, sbound.height);
            var bounds = Game.Level.Collide (bound);
            if (bounds == null) {
                Move (0, dy);
            } else {  
                Sprite.y = bounds.yMax + 0.1;
            }
        }
        if (hxd.Key.isDown (hxd.Key.S)) {
            dy = SPEED;
            var bound = Bounds.fromValues (Sprite.x, Sprite.y + dy, sbound.width, sbound.height);
            var bounds = Game.Level.Collide (bound);
            if (bounds == null) {
                Move (0, dy);
            } else {  
                Sprite.y = bounds.y - sbound.height - 0.1;
            }
        }
        if (hxd.Key.isDown (hxd.Key.A)) {
            dx = -SPEED;
            var bound = Bounds.fromValues (Sprite.x + dx, Sprite.y, sbound.width, sbound.height);
            var bounds = Game.Level.Collide (bound);
            if (bounds == null) {
                Move (dx, 0);
            } else {  
                Sprite.x = bounds.xMax + 0.1;
            }
        }
        if (hxd.Key.isDown (hxd.Key.D)) {
            dx = SPEED;
            var bound = Bounds.fromValues (Sprite.x + dx, Sprite.y, sbound.width, sbound.height);
            var bounds = Game.Level.Collide (bound);
            if (bounds == null) {
                Move (dx, 0);
            } else {  
                Sprite.x = bounds.x - sbound.width - 0.1;
            }
        }  */  
    }
}