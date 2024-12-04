class Particle{
  PVector position = new PVector(random(0,600), random(0,900));
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  float rotation = random(0, radians(360));
  int edgardType = int(random(0,4.1));
}

// they randomly move around but since its tied to acceleration it looks smooth
void moveParticles(){
  for(int i = 0; i < particles.size(); i++){
    // x
    particles.get(i).acceleration.x = random(-0.05,0.05);
    particles.get(i).velocity.x += particles.get(i).acceleration.x;
    particles.get(i).velocity.x = constrain(particles.get(i).velocity.x, -5, 5);
    // they also bounce off the walls instead of sliding against them or passing them
    if(particles.get(i).position.x < 0 || particles.get(i).position.x > 600){
      particles.get(i).velocity.x = -particles.get(i).velocity.x;
    }
    particles.get(i).position.x += particles.get(i).velocity.x;
    // y
    particles.get(i).acceleration.y = random(-0.05,0.05);
    particles.get(i).velocity.y += particles.get(i).acceleration.y;
    particles.get(i).velocity.y = constrain(particles.get(i).velocity.y, -5, 5);
    if(particles.get(i).position.y < 0 || particles.get(i).position.y > 900){
      particles.get(i).velocity.y = -particles.get(i).velocity.y;
    }
    particles.get(i).position.y += particles.get(i).velocity.y;
    particles.get(i).rotation += random(0,0.3);
  }
}

void drawParticles(){
  stroke(255);
  strokeWeight(5);
  for(int i = 0; i < particles.size(); i++){
    // funny secret you should try it out
    if(konami == 8){
      pushMatrix();
      translate(particles.get(i).position.x, particles.get(i).position.y);
      rotate(particles.get(i).rotation);
      switch(particles.get(i).edgardType){
        case 0:
          image(edgardKitBL, -35, -35, 75, 75);
          break;
        case 1:
          image(edgardHappy, -35, -35, 75, 75);
          break;
        case 2:
          image(edgardAngry, -35, -35, 100, 75);
          break;
        case 3:
        image(edgardDoingWhatNoLeaguePlayerEverDoes, -35, -35, 75, 75);
          break;
        case 4:
          image(steamhappy, -35, -35, 50, 50);
          break;
        default:
          image(edgardHappy, -35, -35, 75, 75);
          break;
      }
      popMatrix();
    }
    else{
      point(particles.get(i).position.x, particles.get(i).position.y);
    }
  }
}
