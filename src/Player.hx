/**
    Player entity
**/
class Player extends Entity {       
    private static inline var SPEED = 5;

    private var _graph : h2d.Graphics;

    /**
        Constructor
    **/
    public function new () {
        super ();

        var tile = h2d.Tile.fromColor(0xFF0000, 32, 32);
        Sprite = new h2d.Bitmap(tile, Main.Scene);
        Sprite.x = Main.Scene.width * 0.5;
        Sprite.y = Main.Scene.height * 0.5;
        _graph = new h2d.Graphics (Sprite);

        _graph.lineStyle(1, 0xFF00FF);
        _graph.drawRect (-16, -16, 32, 32);
        _graph.drawRect (16, -16, 32, 32);
        _graph.drawRect (-16, 16, 32, 32);
        _graph.drawRect (16, 16, 32, 32);
    }

    /**
        On update
    **/
    public override function Update (dt : Float) : Void {
        if (hxd.Key.isDown (hxd.Key.W)) {
            Move (0, -SPEED);
        }
        if (hxd.Key.isDown (hxd.Key.S)) {
            Move (0, SPEED);
        }
        if (hxd.Key.isDown (hxd.Key.A)) {
            Move (-SPEED, 0);
        }
        if (hxd.Key.isDown (hxd.Key.D)) {
            Move (SPEED, 0);
        }                
    }
}