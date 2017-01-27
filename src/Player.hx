import differ.shapes.Circle;

/**
    Player entity
**/
class Player extends Entity {
    /**
        Tile size
    **/
    public static inline var SIZE : Int = 32;

    /**
        Move speed
    **/
    private static inline var SPEED = 5;    

    /**
        Player shape
    **/
    private var _shape : Circle;

    /**
        Constructor
    **/
    public function new (x : Int, y : Int) {
        super (x, y, SIZE);
        Sprite.tile = h2d.Tile.fromColor(0xFF0000, SIZE, SIZE);
    }

    /**
        On update
    **/
    public override function Update (dt : Float) : Void {
        var dx : Int = 0;
        var dy : Int = 0;

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
    }
}