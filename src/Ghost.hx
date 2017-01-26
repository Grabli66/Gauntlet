/**
    Ghost enemy
**/
class Ghost extends Entity {
    /**
        Move speed
    **/
    private static inline var SPEED = 2;

    /**
        Constructor
    **/
    public function new (x : Int, y : Int) {
        super (x, y);
        Sprite.tile = h2d.Tile.fromColor(0x0000FF, 32, 32);
    }

    /**
        Update enemy logic
    **/
    public override function Update (dt : Float) : Void {
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