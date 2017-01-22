import h2d.col.IPoint;

/**
    Level
**/
class Level {
    /**
        Tile size
    **/
    public static inline var SIZE : Int = 32;

    /**
        Tile data for level
    **/
    private var _tileGroup : h2d.TileGroup;

    /**
        Collide grid
    **/
    private var _colliders : Array<IPoint>;

    /**
        Constructor
    **/
    public function new () {
        _colliders = new Array<IPoint> ();


        var tile = h2d.Tile.fromColor(0xFFAAFF, SIZE, SIZE);
        _tileGroup = new h2d.TileGroup (tile, Main.Scene);

        _tileGroup.x = 400;
        _tileGroup.y = 400;

        for (i in 0...10) {
            _tileGroup.add (SIZE * i, 0, tile);
            _colliders.push (new IPoint (i, 0));
        }
        trace (_colliders);
    }

    /**
        Check collision
    **/
    public function Collide ( e : Entity) : Bool {
        var bounds = e.GetBounds ();
        var x: Int = Math.round ((bounds.x - _tileGroup.x) / SIZE);
        var y: Int = Math.round ((bounds.y - _tileGroup.y) / SIZE);        
        for (point in _colliders) {
            if ((point.x == x) && (point.y == y)) {                
                return true;
            }
        }

        return false;
    }
}