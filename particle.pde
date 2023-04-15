public class Particle {
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public float dimension;
  
  // dimension
  public void setDimension(float dimension) {
    this.dimension = dimension;
  }
  
  // position
  public void setPosition(float x, float y) {
    this.position.set(x, y);
  }
  public void updatePosition(PVector velocity) {
    this.position.add(velocity);
  }
  
  // velocity
  public void setVelocity(float vx, float vy) {
    this.velocity.set(vx, vy);
  }
  public void updateVelocity(PVector acceleration) {
    this.velocity.add(acceleration);
  }
  
  // acceleration
  public void setAcceleration(float ax, float ay) {
    this.acceleration.set(ax, ay);
  }
  
  // draw
  public void display() {
    circle(this.position.x, this.position.y, this.dimension);
  }
}
