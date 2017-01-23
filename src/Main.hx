class Main extends hxd.App {    
    private var _player : Player;
    public static var Level : Level;

    public static var Scene : h2d.Scene;    

    override function init () {
        Scene = s2d;        
        _player = new Player ();
        Level = new Level ();
    }

    override function update (dt:Float) {		
        _player.Update (dt);
	}

    static function main () {
        hxd.Res.initEmbed();
        new Main ();
    }
}
