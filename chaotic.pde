int N = 10000;
Particle[] particles = new Particle[N];

int diameter;
float G;
int d;
int step;

float sum;

void setup() {
  //size(2*765, 765);
  fullScreen();
  
  diameter = 900;
  G = 0.02;
  d = 2;
  step = 3;
  
  // init particles
  for (int i=0;i<N;i++) {
    Particle particle = new Particle();
    
    particle.setDimension(d);
    particle.setPosition(width/2 + 300.0 - i/1000.0, height/2 + 50);
    particle.setVelocity(0, 3);
    particle.setAcceleration(0, G);
    
    particles[i] = particle;
  }
}

void draw() {
  background(0);
  
  // circle container
  stroke(0, 100, 150);
  strokeWeight(2);
  noFill();
  arc(width/2, height/2, diameter, diameter, -0.5, PI + 0.5); 
  
  // particles
  noStroke();
  fill(0, 100, 150);
  for (Particle particle : particles) {
    particle.updateVelocity(particle.acceleration);
    particle.updatePosition(particle.velocity);
    
    float theta = atan2(particle.position.y - height/2, particle.position.x - width/2);
    sum += theta;
    
    if (sqrt(pow(particle.position.x - width/2, 2) + pow(particle.position.y - height/2, 2)) > (diameter/2 - d/2)) {
      PVector n = new PVector(cos(theta), sin(theta));
      float v_normal = 2 * particle.velocity.dot(n);
      
      particle.setPosition(width/2 + ((diameter/2 - d/2) * cos(theta)), height/2 + ((diameter/2 - d/2) * sin(theta)));
      particle.setVelocity(particle.velocity.x - (v_normal * cos(theta)), particle.velocity.y - (v_normal * sin(theta)));
    }
    
    particle.display();    
  }  
}
