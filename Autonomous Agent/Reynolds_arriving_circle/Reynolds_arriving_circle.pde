ArrayList<Vehicle> vehicles;
PVector target;
void setup(){
  size(800,400);
  vehicles=new ArrayList<Vehicle>();
  target=new PVector(width/2,height/2);

}

void draw(){
  background(255);
  fill(127,115);
  ellipse(target.x,target.y,200,200);
  for(Vehicle v: vehicles){
    v.arrive(target);
    v.update();
    v.display();
  }
}

void mousePressed(){
  vehicles.add(new Vehicle(mouseX,mouseY));
}