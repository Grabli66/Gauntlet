import particles.Particles2D;

/**
    Enemy abstract
**/
class Enemy extends Entity {
    /**
        Particles for hit
    **/
    private var _hitParticles : Particles2D;

    /**
        Enemy life
    **/
    public var Life : Int = 10;

    /**
        On player weapon hit
    **/
    public function OnHit (power : Int) : Void {
        Life -= power;
        if (!_hitParticles.active) _hitParticles.Emit (true);
        if (Life <= 0) {
            OnDeath ();
        }
    }

    /**
        Process death
    **/
    public function OnDeath () : Void {
        Sprite.remove ();        
        Game.RemoveEnemy (this);
        Game.Scene.removeChild (_hitParticles);
    }

    /**
        Constructor
    **/
    public function new (x : Int, y : Int, size : Int) {
        super (x, y, size); 
        _hitParticles = new Particles2D ();
        _hitParticles.x = 0;
        _hitParticles.y = 0;
        _hitParticles.emitterType = Particles2D.EMITTER_TYPE_GRAVITY;
        _hitParticles.texture = h2d.Tile.fromColor(0xFF00FF, 16, 16);
        _hitParticles.particleLifespan = 1;
        _hitParticles.startParticleSize = 8;        
        _hitParticles.maxParticles = 100;
        _hitParticles.duration = 1;
        _hitParticles.rotatePerSecond = 60;
        _hitParticles.angle = 2;
        _hitParticles.angleVariance = 0.5;
        _hitParticles.speed = 50;
        _hitParticles.startColor = { r:1, g:1, b:1, a:1 };
        Game.Scene.addChild (_hitParticles);        
    }

    /**
        Update enemy logic
    **/
    public override function Update (dt : Float) : Void {
        _hitParticles.x = Sprite.x;
        _hitParticles.y = Sprite.y;
    }
}