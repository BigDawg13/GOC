class BigBullet extends Sprite {
      long delay = 4000;
      long mark = millis() + delay;
  
      BigBullet(float x, float y, PVector velocity, int team) {
        super(x, y, 60, 50); // invoke parent constructor
        vel = velocity;
        this.team = team;
    }
    BigBullet(PVector pos, PVector vel, int team) {
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
