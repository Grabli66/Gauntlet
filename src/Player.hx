import differ.shapes.Circle;
import h2d.Sprite;
import h2d.Graphics;
import h2d.Bitmap;
import h2d.col.Point;

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
        Player Bitmap
    **/
    private var _bitmap : Bitmap;

    /**
        Sword graphics
    **/
    private var _sword : Sprite;

    /**
        Player shape
    **/
    private var _shape : Circle;

    /**
        Is sword moving
    **/
    private var _isSwordMoving : Bool;

    private var _swordMoveTime : Float = 0.0;

    /**
        Start to move sword
    **/
    private function StartSword () : Void {
        if (_isSwordMoving) return;
        _isSwordMoving = true;
        _sword.visible = true;
        var mx = Game.Scene.mouseX;
        var my = Game.Scene.mouseY;
        var p = Game.Scene.globalToLocal (new Point(mx, my));        
        var center = GetCenter ();
        var distX = center.x - p.x;
        var distY = center.y - p.y;
        var nv = new h3d.Vector (distX, distY, 0, 0);
        nv.normalizeFast ();        
        _sword.rotation = Math.atan2 (nv.y, nv.x);        
    }

    /**
        Move Sword
    **/
    private function MoveSword (dt : Float) : Void {
        if (!_isSwordMoving) return;      
        if (_swordMoveTime > 20) {
            _isSwordMoving = false;
            _sword.visible = false;
            _swordMoveTime = 0;          
            return;
        }
        _sword.rotate (0.2);
        _swordMoveTime += dt;          
    }

    /**
        Constructor
    **/
    public function new (x : Int, y : Int) {
        super (x, y, SIZE);
        var tile = h2d.Tile.fromColor(0xFF0000, SIZE, SIZE);
        _bitmap = new Bitmap (tile, Sprite);

        _sword = new Sprite ();
        Sprite.addChild (_sword);
        _sword.x = SIZE / 2;
        _sword.y = SIZE / 2;        
        
        var sword = new Graphics (Sprite);        
        sword.beginFill (0xFF0000);
        sword.moveTo (0, 0);
        sword.lineTo (60, 12);
        sword.lineTo (0, 28);
        sword.endFill ();
        sword.x = SIZE;
        sword.y = 2;
        _sword.addChild (sword);
        _sword.visible = false;
        _isSwordMoving = false;
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

        if (hxd.Key.isDown (hxd.Key.MOUSE_LEFT)) {            
            StartSword ();
        }

        MoveSword (dt);                
        Move (dx, dy);
    }
}