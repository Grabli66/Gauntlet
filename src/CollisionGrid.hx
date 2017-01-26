import h2d.col.IBounds;

enum Side {
    Top;
    Right;
    Bottom;
    Left;
}

/**
    Info of collider
**/
typedef CollideInfo = {
    Data : Dynamic,
    Side : Side
}

/**
    Grid cell
**/
class Cell {
    public var Objects : Array<Dynamic>;

    /**
        Constructor
    **/
    public function new () {
        Objects = new Array<Dynamic> ();
    }
}

/**
    For check collisions
**/
class CollisionGrid {
    /**
        Grid cells
    **/
    private var _cells : Array<Array<Cell>> = new Array<Array<Cell>> ();

    /**
        Cell count on x
    **/
    public var CountX (default, null) : Int;

    /**
        Cell count on y
    **/
    public var CountY (default, null) : Int;

    /**
        Cell size
    **/
    public var CellSize (default, null) : Int;

    /**
        Constructor
    **/
    public function new (countX : Int, countY : Int, cellSize : Int) {
        CountX = countX;
        CountY = countY;
        CellSize = cellSize;
        
        for (x in 0...CountX) {
            var cells = new Array<Cell> ();
            for (y in 0...CountY) {
                cells.push (new Cell ());
            }
            _cells.push (cells);
        }
    }

    /**
        Set cell data by id
    **/
    public function SetByIdx (idx : Int, idy : Int, data : Dynamic) : Void {
        _cells[idx][idy].Objects.push (data);
    }

    /**
        Set cell data by id
    **/
    public function SetByBounds (bound : IBounds, data : Dynamic) : Void {
        
    }

    /**
        Try to move 
    **/
    public function Move (dx : Int, dy : Int, bound : IBounds) : { dx : Int, dy : Int} {        
        var rx = dx;
        var ry = dy;
        
        // Check from top
        var nx = bound.x;
        var ny = bound.y + dy;
        var idx = Math.floor (nx / CellSize);
        var idy = Math.floor (ny / CellSize);        
        if (_cells[idx][idy].Objects.length > 0) {
            ry = 0;
        }
        var nx = bound.x + bound.width;
        var ny = bound.y + dy;
        var idx = Math.floor (nx / CellSize);
        var idy = Math.floor (ny / CellSize);
        if (_cells[idx][idy].Objects.length > 0) {
            ry = 0;                
        }

        // Check from bottom
        var nx = bound.x;
        var ny = bound.y + dy + bound.height;
        var idx = Math.floor (nx / CellSize);
        var idy = Math.floor (ny / CellSize);
        if (_cells[idx][idy].Objects.length > 0) {
            ry = 0;                
        }
        var nx = bound.x + bound.width;
        var ny = bound.y + dy + bound.height;
        var idx = Math.floor (nx / CellSize);
        var idy = Math.floor (ny / CellSize);
        if (_cells[idx][idy].Objects.length > 0) {
            ry = 0;                
        }

        // Check from left
        var nx = bound.x + dx;
        var ny = bound.y;
        var idx = Math.floor (nx / CellSize);
        var idy = Math.floor (ny / CellSize);
        if (_cells[idx][idy].Objects.length > 0) {
            rx = 0;                
        }
        var nx = bound.x + dx;
        var ny = bound.y + bound.height;
        var idx = Math.floor (nx / CellSize);
        var idy = Math.floor (ny / CellSize);
        if (_cells[idx][idy].Objects.length > 0) {
            rx = 0;                
        }

        // Check from right
        var nx = bound.x + dx + bound.width;
        var ny = bound.y;
        var idx = Math.floor (nx / CellSize);
        var idy = Math.floor (ny / CellSize);
        if (_cells[idx][idy].Objects.length > 0) {
            rx = 0;                
        }
        var nx = bound.x + dx + bound.width;
        var ny = bound.y + bound.height;
        var idx = Math.floor (nx / CellSize);
        var idy = Math.floor (ny / CellSize);
        if (_cells[idx][idy].Objects.length > 0) {
            rx = 0;                
        }         
        

        return { dx : rx, dy : ry };
    }

    /**
        Check collide in point
    **/
    public function Collide (x : Int, y : Int) : CollideInfo {
        return {
            Data : null,
            Side : Top
        }
    }
}