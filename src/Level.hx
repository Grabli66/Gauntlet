import h2d.Tile;
import differ.shapes.Polygon;
import differ.Collision;

/**
    Level cell
**/
class Cell {
    /**
        Cell tile
    **/
    public var Tile (default, null) : Tile;

    /**
        Collision shape
    **/
    public var Square (default, null) : Polygon;

    /**
        Constructor
    **/
    public function new (tile : Tile, info : Dynamic, ?square : Polygon) {
        this.Tile = tile;
        this.Square = square;
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
        Debug drawer
    **/
    private var _debug : h2d.Graphics;

    /**
        Level cells
    **/
    private var _cells : Map<Int, Map<Int, Cell>>;

    /**
        Constructor
    **/
    public function new () {
        _cells = new Map<Int, Map<Int, Cell>> ();

        var tile = h2d.Tile.fromColor(0xFFAAFF, SIZE, SIZE);
        _tileGroup = new h2d.TileGroup (tile, Game.Scene);
        _tileGroup.x = 0;
        _tileGroup.y = 0;

        for (i in 0...15) {
            AddCell (i, 0, tile, null, true);
        }

        for (i in 0...15) {
            AddCell (i, 15, tile, null, true);
        }
    }

    /**
        Add new cell
    **/
    public function AddCell (idx : Int, idy : Int, tile : Tile, info : Dynamic, isCollide : Bool = false) : Void {
        var cx = _cells[idx];
        if (cx == null) {
            cx = new Map<Int, Cell> ();
            _cells[idx] = cx;
        }               

        cx[idy] = new Cell (tile, info);
        var x = idx * SIZE;
        var y = idy * SIZE;
        _tileGroup.add (x, y, tile);
        var box = Polygon.square (x, y, SIZE, false);
        Game.AddShape (box);
    }
}