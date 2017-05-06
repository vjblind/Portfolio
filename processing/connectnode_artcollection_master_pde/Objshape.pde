 class objshape {
 PVector p= new PVector(10,10);
 PVector s= new PVector(10,10);
 color col=         color(250);
int  id=0;
objshape(){












}
 public void draw() {
   
 ellipse(p.x,p.y,s.x,s.y);
  }
}