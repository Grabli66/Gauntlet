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

        var bounds = Main.Level.Collide (this);
        if (bounds != null) {
            if (dy < 0) Move (0, -(bounds.y - bounds.yMax));
            if (dy > 0) Move (0, -(bounds.yMax - bounds.y));
            if (dx < 0) Move (-(bounds.x - bounds.xMax), 0);
            if (dx > 0) Move (-(bounds.xMax - bounds.x), 0);            
        }
    }
}