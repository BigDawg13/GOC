class SpriteManager {
    Player player;
    
    ArrayList<Sprite> active = new ArrayList<Sprite>();
    ArrayList<Sprite> destroyed = new ArrayList<Sprite>();
    int mark = 1000; // ms
    long wait = millis();
    long done = 0;
    
    SpriteManager() {
        player = new Player(width / 2, height - 100);
        spawn(player);
    }
    
    void endScreenJazz() {
        Player end = new Player(width / 2, height - 100);
        spawn(end);
        if(key == 'N' || key == 'n') {
          killEverything();
          asdf = 5;
          player = new Player(width / 2, height - 100);
          spawn(player);
          level = 1;
        }
    }
    void endScreenJazzL1() {
        Player end = new Player(width / 2, height - 100);
        spawn(end);
        if(key == 'N' || key == 'n') {
          killEverything();
          if(asdf <= 0) Level1();
          asdf = 5;
          player = new Player(width / 2, height - 100);
          spawn(player);
          level = 1;
          //Level1();
        }
    }
    
    private void levelUp() {
      level++;
    }
    
    public void setWait() {
      wait = millis();
    };
    
    boolean levCheck() {
      if(active.size() == 1 && level != -1 && level != 6) {
        _TM.levelUp();
        if(done < 1) {
          done++;
          setWait();
        }
        if(millis() > wait + mark) {
          //wait = millis();
          levelUp();
          done = 0;
          return true;
        }
        
      }
      else if(level == 6) return true;
      return false;
    }
    
    void killEverything() {
      for(Sprite a : active) {
        destroyed.add(a);
      }
      bringOutTheDead();
    }
    
    void destroy(Sprite target) {
        destroyed.add(target);
    }
    
    void spawn(Sprite obj) {
        active.add(obj);
    }
    
    void manage() {
        moveEverything();
        checkCollisions();    
        bringOutTheDead();
        drawEverything();
    }
    
    void moveEverything() {
        for(int i = active.size() - 1; i >= 0; i--) {
            active.get(i).update();           
        }
    }
    
    void drawEverything() {
        for (Sprite s : active)
            s.display();
    }
    
    void checkCollisions() {
        for (int i = 0; i < active.size(); i++) {
            for (int j = i + 1; j < active.size(); j++) {
                Sprite a = active.get(i);
                Sprite b = active.get(j);
                if (a.team != b.team && collision(a, b)) {
                    active.get(i).handleCollision();
                    active.get(j).handleCollision();
                }
            }
        }
    }
    
    void bringOutTheDead() {
        for (int i = 0; i < destroyed.size(); i++) {
            Sprite target = destroyed.get(i);
            active.remove(target);
            destroyed.remove(target);
        }
    }
    
    boolean collision(Sprite a, Sprite b) {
        // assumes equal w and h
        float r1 = a.size.x / 2.0;
        float r2 = b.size.x / 2.0;
        return r1 + r2 > dist(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
    }
}
