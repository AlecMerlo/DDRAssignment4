class Particle{
  PVector position = new PVector(random(0,600), random(0,900));
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  float rotation = random(0, radians(360));
}

void moveParticles(){
  for(int i = 0; i < particles.size(); i++){
    particles.get(i).acceleration.x = random(-0.05,0.05);
    particles.get(i).velocity.x += particles.get(i).acceleration.x;
    particles.get(i).velocity.x = constrain(particles.get(i).velocity.x, -5, 5);
    if(particles.get(i).position.x < 0 || particles.get(i).position.x > 600){
      particles.get(i).velocity.x = -particles.get(i).velocity.x;
    }
    particles.get(i).position.x += particles.get(i).velocity.x;
    particles.get(i).acceleration.y = random(-0.05,0.05);
    particles.get(i).velocity.y += particles.get(i).acceleration.y;
    particles.get(i).velocity.y = constrain(particles.get(i).velocity.y, -5, 5);
    if(particles.get(i).position.y < 0 || particles.get(i).position.y > 900){
      particles.get(i).velocity.y = -particles.get(i).velocity.y;
    }
    particles.get(i).position.y += particles.get(i).velocity.y;
    particles.get(i).rotation += random(0,0.2);
  }
}

void drawParticles(){
  stroke(255);
  strokeWeight(5);
  for(int i = 0; i < particles.size(); i++){
    println(konami);
    if(konami == 8){
      pushMatrix();
      translate(particles.get(i).position.x, particles.get(i).position.y);
      rotate(particles.get(i).rotation);
        image(edgardKitBL, -35, -35, 75, 75);
      popMatrix();
    }
    else{
      point(particles.get(i).position.x, particles.get(i).position.y);
    }
  }
}
