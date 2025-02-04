class Bullet extends Sprite {
    long delay = 4000;
    long mark = millis() + delay;
    Bullet(float x, float y, PVector velocity, int team) {
        super(x, y, 10, 10); // invoke parent constructor
        vel = velocity;
        this.team = team;
    }

    Bullet(PVector pos, PVector vel, int team) {
        // constructor chaining
        this(pos.x, pos.y, vel, team); // invoke another own constructor
        // this refers to the above on line 3
    }
    
    @Override
    void update() {
        pos.add(vel);
        if(millis() > mark) {
          _SM.destroy(this);
        }
    }
}
