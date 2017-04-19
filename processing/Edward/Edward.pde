
PImage pic;
PShape s, Edward, t; 
PShape[] sh=new PShape[100]; 
void setup() {
  size(800, 600,P2D);
  s = createShape();
  s.beginShape();
  s.vertex(0, 0);
  s.vertex(60, 0);
  s.vertex(60, 60);
  s.vertex(0, 60);
  s.endShape(CLOSE);
  Edward=  loadShape("drawing-1.svg") ;

  t=  loadShape("drawing-2.svg") ;
  // Iterate over the children
  int children = t.getChildCount();
  for (int i = 0; i < children; i++) {

    PShape child = t.getChild(i);
    sh[i]= t.getChild(i); 

    int total = child.getVertexCount();
    println(t.getChildCount());
    println(sh[i].getChildCount());
  }
  
  pic=loadImage("738.jpg");
}

void draw() {
  background(150);

  for (int z = 1; z<  t.getChildCount(); z++) 
    for (int u = 0; u<  t.getChild(z).getChildCount()-1; u++){
      
  //    println( t.getChild(z).getChild(u).getName());
      for (int i = 0; i  <t.getChild(z).getChild(u).getVertexCount(); i++)
      {
        PVector v = t.getChild(z).getChild(u).getVertex(i);
        v.x += random(-0.1, 0.1);
        v.y += random(-0.1, 0.1);
       // t.getChild(z).getChild(u).setVertex(i, v);
      }


}
  for (int z = 1; z<  t.getChildCount(); z++) {



    for (int u = 0; u<  t.getChild(z).getChildCount(); u++) {

      t.getChild(z).getChild(u).resetMatrix();   
      //   t.getChild(1).getChild(u).translate(mouseX-250,mouseY-250);
      //  println(t.findChild("pivot").getParent().getName()+" "+t.findChild("pivot").getName());
      //println(t.getChild(z).getChild(u).getFamily()+"");
      // PShape .GEOMETRY 103
      // PShape . PATH  102
      // PShape.PRIMITIVE 101

      println( t.getChild(z).getName());


 if(t.getChild(z).getChild(u).getFamily()==0)
      {
        String parentx= t.getChild(z).getName()+"p";

        float[] v = t.findChild(parentx).getParams();
        t.getChild(t.getChild(z).findChild(parentx).getParent().getName()).getChild(u).translate(v[0], v[1]);
        t.getChild(t.getChild(z).findChild(parentx).getParent().getName()).getChild(u).rotate(  10);
        t.getChild(t.getChild(z).findChild(parentx).getParent().getName()).getChild(u).translate(-v[0], -v[1]);
      }
    }
  } 
 
 
  for (int z = 1; z<  t.getChildCount(); z++) 
    for (int u = 0; u<  t.getChild(z).getChildCount(); u++){
  // t.getChild(z).getChild(u).scale(2);
      shape( t.getChild(z).getChild(u),300, 0);
}
  for (int u = 0; u <  t.getChildCount()%3; u++)sh[u].resetMatrix();
}
void mouseMoved() {
}


PVector drag= new PVector(-500, 0-500);
void mouseDragged() {
  int xx=0, yy= 0 ;


  if (mouseButton==0) {
    xx=mouseX; 
    yy= mouseY ;
    drag=new PVector(0, 0);
  }
}

PVector mx() {
  return new PVector(mouseX, mouseY);
}

PVector pmx() {
  return new PVector(pmouseX, pmouseY);
}

void keyPressed()
{
  if (key=='r') { 
    s = createShape();
    s.beginShape();
    s.vertex(0, 0);
    s.vertex(60, 0);
    s.vertex(60, 60);
    s.vertex(0, 60);
    s.endShape(CLOSE);
     Edward=  loadShape("drawing-1.svg") ;

  t=  loadShape("drawing-2.svg") ;
  // Iterate over the children
  int children = t.getChildCount();
  for (int i = 0; i < children; i++) {

    PShape child = t.getChild(i);
    sh[i]= t.getChild(i); 

    int total = child.getVertexCount();
 t.scale(3);
  }
  }
}