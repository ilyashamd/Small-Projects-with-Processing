FlowField f;
ArrayList<Vehicle> vehicles;
int r;

void setup(){
  size(600,400);
  r=20;
  f=new FlowField(r);
  
  vehicles=new ArrayList<Vehicle>();
  for(int i=0; i<100; i++){
    Vehicle v=new Vehicle(random(width),random(height));
    vehicles.add(v);
  }
 
}

void draw(){
  background(255);
  f.display();
  for(Vehicle v:vehicles){
    v.follow(f);
    v.update();
    v.display();
  }
}

void mousePressed(){
  f.init();
}