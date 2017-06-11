
PShader fx;
PGraphics lowPGraphics,srcPGraphics, depthPGraphics, dofPGraphics;

void setup(){
size(800,600,P3D);
lowPGraphics=createGraphics(800/2,600/2,P3D);
srcPGraphics=createGraphics(800,600,P3D);

fx=loadShader("fxfrag.glsl","fxvert.glsl");
background(0);
 }





PImage scene (PGraphics t){

t.beginDraw();
t.background(100);
t.pushMatrix();
t.translate(500,500,0);
t.fill(10);
t.box(100);
t.popMatrix();
t.pushMatrix();
t.translate(500,500,-500);
t.fill(50);
t.box(100);
t.popMatrix();
t.pushMatrix();
t.translate(mouseX/2,height/4,50);
t.fill(250);
t.box(100);
t.popMatrix();
t.endDraw();

return t;


}
void draw(){
  

 surface.setTitle(frameRate+""); //Set the frame title to the frame rate
 
 

   //fx.set("layer",1);
      shader(fx);

  image(scene(srcPGraphics),0 ,0);  

      
     
//rect(0,0,width,height);
//fx.set("textuex",get());




}