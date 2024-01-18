class MiniBoss extends Invader {
  
  int hit = 0;
  long mark, wait = 500; // ms
  
  public MiniBoss(float x, float y) {
    super(x, y, 30, 30);
    mark = millis();
  }
  
  @Override
  public void handleCollision() {
    hit++;
    if(hit > 2) _SM.destroy(this);
    }
    
  @Override
  public void update() {
    super.update();
    PVector aim = new PVector(_SM.player.pos.x - this.pos.x, _SM.player.pos.y - this.pos.y);
        aim = aim.normalize().mult(12); // turn this into a single unit vector, then increase its magnitude

    //if(millis() - mark > wait) {
      mark = millis();
      _SM.spawn(new Bullet(pos, aim, team));
      _SM.spawn(new Bullet(pos, aim.rotate(40), team));
      _SM.spawn(new Bullet(pos, aim.rotate(-40), team));
    //}
  }
}
