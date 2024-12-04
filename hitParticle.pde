class HitParticle{
  PVector position = new PVector();
  PVector velocity = new PVector(random(-1, 1), random(-1, 1));
  PVector acceleration = new PVector(-velocity.x/20, -velocity.y/20);
  int lifetime = 800;
}

void hitParticleCreate(int x, int y){
  int maxParticles = hitParticles.size();
  for(int i = hitParticles.size(); i < maxParticles + 20; i++){
    hitParticles.add(new HitParticle());
    hitParticles.get(i).position.x = x;
    hitParticles.get(i).position.y = y;
  }
}

void hitParticleMoveAndDisplay(){
  for(int i = 0; i < hitParticles.size(); i++){
    hitParticles.get(i).acceleration.x *= 0.1;
    hitParticles.get(i).acceleration.y *= 0.1;
    hitParticles.get(i).velocity.x += hitParticles.get(i).acceleration.x;
    hitParticles.get(i).velocity.y += hitParticles.get(i).acceleration.y;
    hitParticles.get(i).position.x += hitParticles.get(i).velocity.x;
    hitParticles.get(i).position.y += hitParticles.get(i).velocity.y;
    stroke(0,100,255,100);
    strokeWeight(hitParticles.get(i).lifetime / 50);
    point(hitParticles.get(i).position.x, hitParticles.get(i).position.y);
    hitParticles.get(i).lifetime -= 20;
    if(hitParticles.get(i).lifetime <= 0){
      hitParticles.remove(i);
    }
    stroke(0);
    strokeWeight(4);
  }
}
