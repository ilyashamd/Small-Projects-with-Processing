import shiffman.box2d.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;


Box2DProcessing box2d;
ArrayList<Car> cars;
Surface sf;

void setup(){
  size(700,400);
  box2d= new Box2DProcessing(this);
  box2d.createWorld();
  cars=new ArrayList<Car>();
  sf=new Surface();

}

void draw(){
  background(255);
  box2d.step();
  sf.display();
  
  for (Car p: cars){
    p.display();
  }  
}

void mousePressed() {
    Car p=new Car(mouseX,mouseY);
    cars.add(p);
  }