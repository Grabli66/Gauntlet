
import h2d.col.Bounds;
import h2d.col.IPoint;

/**
    Cell of collider grid
**/
class ColliderCell {
    /**
        Constructor
    **/
    public function new () {

    }
}

/**
    Grid of colliders
**/
class ColliderGrid {
    /**
        Collide grid
    **/
    private var _colliders : Map<Int, Map<Int, ColliderCell>>; 

    /**
        Constructor
    **/
    public function new () {
        _colliders = new Map<Int, Map<Int, ColliderCell>> ();
    }

    /**
        Add grid cell
    **/
    public function Add (idx : Int, idy : Int, cell : ColliderCell) : Void {                
        var n = _colliders[idx];
        
        if (n == null) {
            n = new Map<Int, ColliderCell> ();
            _colliders[idx] = n;
        }

        n[idy] = cell;
        trace (_colliders);
    }

    /**
        Collider exist
    **/
    public function Exist (idx : Int, idy : Int) : Bool {        
        var n = _colliders[idx];
        if (n == null) return false;
        var cell = n[idy];
        if (cell == null) return false;
        return true;
    }
}

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
        Grid with colliders
    **/
    private var _collideGrid : ColliderGrid;

    /**
        Debug drawer
    **/
    private var _debug : h2d.Graphics;

    /**
        Constructor
    **/
    public function new () {
        _collideGrid = new ColliderGrid ();

        var tile = h2d.Tile.fromColor(0xFFAAFF, SIZE, SIZE);
        _tileGroup = new h2d.TileGroup (tile, Main.Scene);

        _tileGroup.x = 0;
        _tileGroup.y = 0;

        for (i in 5...15) {
            _tileGroup.add (SIZE * i, 0, tile);
            _collideGrid.Add (i, 0, new ColliderCell ());
        }

        for (i in 5...15) {
            _tileGroup.add (SIZE * i, 10 * 32, tile);
            _collideGrid.Add (i, 10, new ColliderCell ());
        }        

        _debug = new h2d.Graphics (Main.Scene);
        _debug.x = 0;
        _debug.y = 0;
    }

    /**
        Check collision
    **/
    public function Collide ( e : Bounds) : Bounds {
        var bounds = e;
        var points = new List<IPoint> ();
        points.push (new IPoint (Math.floor ((bounds.x - _tileGroup.x) / SIZE), Math.floor ((bounds.y - _tileGroup.y) / SIZE)));
        points.push (new IPoint (Math.floor ((bounds.xMax - _tileGroup.x) / SIZE), Math.floor ((bounds.y - _tileGroup.y) / SIZE)));
        points.push (new IPoint (Math.floor ((bounds.x - _tileGroup.x) / SIZE), Math.floor ((bounds.yMax - _tileGroup.y) / SIZE)));
        points.push (new IPoint (Math.floor ((bounds.xMax - _tileGroup.x) / SIZE), Math.floor ((bounds.yMax - _tileGroup.y) / SIZE)));

        _debug.clear ();
        _debug.lineStyle(1, 0xFF00FF);

        var res : Bounds = null;
        for (p in points) {
            var dex : Int = Math.floor (_tileGroup.x + p.x * SIZE);
            var dey : Int = Math.floor (_tileGroup.y + p.y * SIZE);

            var ibo = h2d.col.Bounds.fromValues (dex, dey, SIZE, SIZE);
            if (_collideGrid.Exist (p.x, p.y)) {
                if (res == null) res = new Bounds ();
                var intb = bounds.intersection (ibo);
                res.addBounds (intb);

                _debug.beginFill (0xFFFF00);
                _debug.drawRect (res.x, res.y, res.width, res.height);
                _debug.endFill ();
            }                                

            _debug.drawRect (ibo.x, ibo.y, ibo.width, ibo.height);
        }
        return res;
    }
}