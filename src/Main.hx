class Main extends hxd.App {    
    private var _player : Player;
    private var _level : Level;

    public static var Scene : h2d.Scene;    

    override function init () {
        Scene = s2d;
        _level = new Level ();
        _player = new Player ();
    }

    override function update (dt:Float) {		
        _player.Update (dt);

        _level.Collide (_player);
	}

    static function main () {
        hxd.Res.initEmbed();
        new Main ();
    }
}
