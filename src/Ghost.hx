import h2d.Bitmap;

/**
    Ghost enemy
**/
class Ghost extends Enemy {
    /**
        Tile size
    **/
    public static inline var SIZE : Int = 32;

    /**
        Move speed
    **/
    private static inline var SPEED = 2;

    /**
        Enemy Bitmap
    **/
    private var _bitmap : Bitmap;

    /**
        Constructor
    **/
    public function new (x : Int, y : Int) {
        super (x, y, SIZE);
        var tile = h2d.Tile.fromColor(0x0000FF, SIZE, SIZE);
        _bitmap = new Bitmap (tile, Sprite);
    }    

    /**
        Update enemy logic
    **/
    public override function Update (dt : Float) : Void {
        super.Update (dt);
        
        var pb = Game.Player.GetBounds ();
        var sb = GetBounds ();

        var dx = 0;
        var dy = 0;

        if (pb.x < sb.x) dx = -SPEED;
        if (pb.x > sb.x) dx = SPEED;
        if (pb.y < sb.y) dy = -SPEED;
        if (pb.y > sb.y) dy = SPEED;

        Move (dx, dy);
    }
}