class MiniBoss extends Invader {
  
  int hit = 0;
  
  public MiniBoss() {
    super(500, 200, 55, 55);
  }
  
  @Override
  public void handleCollision() {
    if(hit > 2) _SM.destroy(this);
    }
    
  @Override
  public void update() {
    super.update();
    
  }
  
}
