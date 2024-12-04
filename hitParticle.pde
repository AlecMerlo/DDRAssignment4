class HitParticle{
  PVector position = new PVector();
  PVector velocity = new PVector(random(-3, 3), random(-3, 3));
  PVector acceleration = new PVector(-velocity.x / 40, -velocity.y / 40);
  int lifetime = 800;
  boolean particleType;
}

// creates 20 more particles every time a note is hit
// x and y is for the starting positions
void hitParticleCreate(int x, int y){
  // to set a max for the loop I made this
  int maxParticles = hitParticles.size();
  for(int i = hitParticles.size(); i < maxParticles + 20; i++){
    hitParticles.add(new HitParticle());
    hitParticles.get(i).position.x = x;
    hitParticles.get(i).position.y = y;
    
    // make steamhappy more common in secret mode :3
    if(konami == 8){
      hitParticles.get(i).particleType = boolean(int(random(0,200)));
    }
    else{
      // that's not very steamhappy of you
      hitParticles.get(i).particleType = boolean(int(random(0,1000)));
    }
  }
}

// wooo here's the acceleration and velocity stuff
// just makes them slow down over time and die out
void hitParticleMoveAndDisplay(){
  for(int i = 0; i < hitParticles.size(); i++){
    hitParticles.get(i).acceleration.x *= 0.1;
    hitParticles.get(i).acceleration.y *= 0.1;
    hitParticles.get(i).velocity.x += hitParticles.get(i).acceleration.x;
    hitParticles.get(i).velocity.y += hitParticles.get(i).acceleration.y;
    hitParticles.get(i).position.x += hitParticles.get(i).velocity.x;
    hitParticles.get(i).position.y += hitParticles.get(i).velocity.y;
    stroke(0,100,255,100);
    strokeWeight(hitParticles.get(i).lifetime / 40);
    if(hitParticles.get(i).particleType){
      point(hitParticles.get(i).position.x, hitParticles.get(i).position.y);
    }
    else{
      image(steamhappy, hitParticles.get(i).position.x, hitParticles.get(i).position.y, 10, 10);
    }
    hitParticles.get(i).lifetime -= 20;
    // deletes the particles so computer doesn't get too mad at me
    if(hitParticles.get(i).lifetime <= 0){
      hitParticles.remove(i);
    }
    stroke(0);
    strokeWeight(4);
  }
}
