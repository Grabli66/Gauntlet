/**
    Enemy abstract
**/
class Enemy extends Entity {
    /**
        Enemy life
    **/
    public var Life : Int = 10;

    /**
        On player weapon hit
    **/
    public function OnHit (power : Int) : Void {
        Life -= power;
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
    }

    /**
        Constructor
    **/
    public function new (x : Int, y : Int, size : Int) {
        super (x, y, size);        
    }    
}