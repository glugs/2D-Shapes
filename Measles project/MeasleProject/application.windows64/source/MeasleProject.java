import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class MeasleProject extends PApplet {

//Global Variables
PVector leftEye;
PVector rightEye;
int reset, smallerDisplayDimension, mouthOpen;
float rectFaceX, rectFaceY, rectFaceWidth, rectFaceHeight;
float faceX, faceY, faceDiameter;
float leftEyeX, leftEyeY, rightEyeX, rightEyeY, eyeDiameter;
float mouthX1, mouthY1, mouthX2, mouthY2;
float xNose1, yNose1, xNose2, yNose2, xNose3, yNose3;
String title = "Bawk! Chicken Pox.";
float titleX, titleY, titleWidth, titleHeight;
PFont titleFont;
int green=0xff144607, resetDefaultInk=0xffFFFFFF;

//
//float rectXPic1, rectYPic1, rectWidthPic1, rectHeightPic1;
//PImage pic1;


//
public void setup() 
{
   background(0xff96F0ED);
   leftEye = new PVector(displayWidth*.38f, displayHeight*.28f);
 rightEye = new PVector(displayWidth*.57f, displayHeight*.28f);
//
//Display Geometry, Display orientation: landscape, portrait, or square
   //size (500, 600);  //displayWidth & displayHeight
  println(displayWidth, displayHeight);
  //Population
  titleX = displayWidth*1/5;
  titleY = displayHeight*1/30;
  titleWidth = displayWidth*3/5; //Rect ends at 4/5's of width
  titleHeight = displayHeight*1/10; //Rect ends at 2/10's of height
  //
  //Fonts from OS (Operating System)
  //String[] fontList = PFont.list(); //To list all fonts available on OS
  //printArray(fontList); //For listing all possible fonts to choose from, then createFont
  titleFont = createFont("Baskerville old face", 58); //Verify the font exists in ProcessingJava
  // Tools / Create Font / Find Font / Do not press "OK", known bug
  //
  
//



  //Display Geometry
fullScreen(); //size(); displayWidth, displayHeight
//Landscape, not square or portrait
println (width, height, displayWidth, displayHeight); //Verification of values
int appWidth = width, appHeight = height; //Swap with displayWidth, displayHeight for testing
println(appWidth, appHeight);

//
//Display Orientation: a few comparisons for IFs
//Computer tells us the orientation, go
String orientation = ( displayWidth >= displayHeight ) ? "Landscape or Square": "Portrait"; 
println("Display Orientation:", orientation); //Verify Veriables
if ( orientation=="Portrait" ) println("Turn your phun");

if ( orientation=="Landscape or Square") 
{
  //Empty IF
} else { 
  println("Turn your phun");
} //FUN 
//
//Variable Population: notice using appWidth & appHeight to move between size() & fullScreen()
smallerDisplayDimension = appHeight; //ALWAYS in Landscape
reset = smallerDisplayDimension / smallerDisplayDimension; //returns "1"
rectFaceX = (appWidth*1/2) - (smallerDisplayDimension*1/2);
rectFaceY =appHeight*0;
rectFaceWidth = smallerDisplayDimension; //Square Shape
rectFaceHeight = smallerDisplayDimension; //Square Shape
faceX = appWidth*1/2;
faceY = appHeight*1/2;
faceDiameter = smallerDisplayDimension;
leftEyeX = appWidth*1.5f/4;
leftEyeY = appHeight*1/4;
rightEyeX = appWidth*2.5f/4;
rightEyeY = leftEyeY; //Best Practice: change one line of code
eyeDiameter = smallerDisplayDimension*1/4;
mouthX1 = leftEyeX;
mouthY1 = appHeight*3/4;
mouthX2 = rightEyeX;
mouthY2 = mouthY1;
mouthOpen = smallerDisplayDimension*1/4;
xNose1 = faceX;
yNose1 = leftEyeY;
xNose2 = faceX - leftEyeY*1/2;
yNose2 = faceY;
xNose3 = faceX + leftEyeY*1/2;
yNose3 = faceY ;
//
//Face: Circle = Inscribing a Circle in a Square
//Center a circle on display orientation
//rect(rectFaceX, rectFaceY, rectFaceWidth, rectFaceHeight);
fill(0xffFFF5F0);
ellipse(faceX, faceY, faceDiameter, faceDiameter);
//

} //End setup
//
public void draw() {

  

 
  PVector mouseVector = new PVector(mouseX, mouseY);

  PVector leftPupil = leftEye.copy().add(mouseVector.copy().sub(leftEye).setMag(30)) ;
  PVector rightPupil = rightEye.copy().add(mouseVector.copy().sub(rightEye).setMag(30));
 //


//
 //smooth();
//noStroke();
//fill(#D80B0B);
//beginShape();
//vertex(50, 15);
//bezierVertex(50, -5, 10, 5, 50, 40);
//vertex(50, 15);
//bezierVertex(50, -5, 10, 5, 50, 40);
//endShape();
//

//
//Measle
float measleDiameter = random(smallerDisplayDimension*1/100 , smallerDisplayDimension*1/25); //Range of measle size: small=*1/100, large=4xbigger (*1/25)
float measleRadius = measleDiameter*1/2;
println (measleRadius);
float measleX = random( rectFaceX+measleRadius, ( ( rectFaceX+rectFaceWidth) - measleRadius) );
float measleY = random( rectFaceY+measleRadius, ( ( rectFaceY+rectFaceHeight) - measleRadius) );
Boolean nightMode=false; //Note: IF-ELSE similar to ternary operator
//color red=#FF0000, measleColour=red, whiteReset=#000000;
int measleColour = ( nightMode==false ) ? color ( 255, random(0,50), random(120) ) : color ( 255, random(0,50), 0 ) ; //ternary operator for day:night
int whiteReset=0xffFFFFFF; // Note: need ranger here too
//
float measleRectX = measleX-measleDiameter*1/2;
float measleRectY = measleY-measleDiameter*1/2;
float measleWidth = measleDiameter;
float measleHeight = measleDiameter;
//rect( measleRectX, measleRectY, measleWidth, measleHeight);
//random values given other variables (similar to button code)
noStroke(); //Shape outline
fill(measleColour);
ellipse( measleX, measleY, measleDiameter, measleDiameter );
stroke(reset);
fill(whiteReset); //reset to first colour (i.e blackReset
////Left Eye
//rect(leftEyeX-eyeDiameter*1/2, leftEyeY-eyeDiameter*1/2, eyeDiameter, eyeDiameter);
ellipse(leftEyeX, leftEyeY, eyeDiameter, eyeDiameter);
//
//Right Eye
//rect(rightEyeX-eyeDiameter*1/2, rightEyeY-eyeDiameter*1/2, eyeDiameter, eyeDiameter);
ellipse(rightEyeX, rightEyeY, eyeDiameter, eyeDiameter);
//
 //eyes
  fill(0xff0F6719);
  ellipse(leftEye.x, leftEye.y, 300, 300);
  ellipse(rightEye.x+150, rightEye.y+0, 300, 300);
  fill(0);
  ellipse(leftPupil.x, leftPupil.y, 200, 200);
  ellipse(rightPupil.x+150, rightPupil.y+10, 200, 200);
  //
//Nose
fill(0xffFFDF24);

//rect(xNose2, yNose1, xNose3-xNose2, yNose3-yNose1);
triangle(xNose1, yNose1, xNose2, yNose2, xNose3, yNose3);
//
fill(0xffF04D5B);
 arc(1370, 1335, 1050, 1200, 0, 9.14f);
//Mouth
fill(0xffF04D5B);
int mouthWidth = PApplet.parseInt (mouthX2 - mouthX1);
int mouthHeight = mouthOpen;
//rect(mouthX1-mouthOpen*1/2, mouthY1-mouthOpen*1/2, mouthWidth+mouthOpen, mouthHeight);
strokeWeight(mouthOpen); //testing: 100=400/4 mouthOpen=height*1/4
line(mouthX1, mouthY1, mouthX2, mouthY2);
strokeWeight(reset); //reset to 1 pixel
//
fill(0xffE38ECE);
 arc(1370, 1335, 1050, 900, 0, 3.14f);
 //Layout our text space and typographical features
 
  //
 
  rect(titleX, titleY, titleWidth, titleHeight);
 fill(green); //Ink, hexidecimal copied from Color Selector
 textAlign(CENTER, CENTER); //Align X&Y, see Processing.org / Reference
 //Values: [ LEFT | CENTER | RIGHT ] & [ TOP | CENTER | BOTTOM | BASEMENT ]
 textFont(titleFont, 150); //Change the number until it fits
 text(title, titleX, titleY, titleWidth, titleHeight);
 fill(resetDefaultInk);
} //End draw
//
public void keyPressed() {} //End keypressed
//
public void mousePressed() {} //End mousePressed
//
//End Main Program




































































































/*//Global variables


PVector leftEye;
PVector rightEye;

void setup(){
  fullScreen();
  leftEye = new PVector(width*.38, height*.28);
 rightEye = new PVector(width*.57, height*.28);
 
}

void draw(){
  background(200);
 // background(#000000);
  PVector mouseVector = new PVector(mouseX, mouseY);

  PVector leftPupil = leftEye.copy().add(mouseVector.copy().sub(leftEye).setMag(40)) ;
  PVector rightPupil = rightEye.copy().add(mouseVector.copy().sub(rightEye).setMag(10));
fill(#FFFFFF);
//draw the head
ellipse(1300, 910, 1800, 1800);
  fill(255);
  ellipse(leftEye.x, leftEye.y, 200, 200);
  ellipse(rightEye.x, rightEye.y, 200, 200);
  //eyes
  fill(0);
  ellipse(leftPupil.x, leftPupil.y, 100, 100);
  ellipse(rightPupil.x, rightPupil.y, 100, 100);
  //mouth
 arc(1290, 1225, 950, 500, 0, 3.14);
 //
 //Nose
 fill(#000000);
triangle(1170, 800, 1282, 1000, 1424, 800);

//teeth
rect(210, 210, 130, 130);
//

} 


///Global Variables
PVector leftEye;
PVector rightEye;
int reset, smallerDisplayDimension, mouthOpen;
float rectFaceX, rectFaceY, rectFaceWidth, rectFaceHeight;
float faceX, faceY, faceDiameter;
float leftEyeX, leftEyeY, rightEyeX, rightEyeY, eyeDiameter;
float mouthX1, mouthY1, mouthX2, mouthY2;
float xNose1, yNose1, xNose2, yNose2, xNose3, yNose3;
pic1 = loadImage("cartoon-chicken-coop-outline-isolated-on-white-background_gg105160839.jpg"); //Dimensions: width 1920, height 1280
//
void setup() 
{
   leftEye = new PVector(width*.38, height*.28);
 rightEye = new PVector(width*.57, height*.28);

  //Display Geometry
fullScreen(); //size(); displayWidth, displayHeight
//Landscape, not square or portrait
println (width, height, displayWidth, displayHeight); //Verification of values
int appWidth = width, appHeight = height; //Swap with displayWidth, displayHeight for testing
println(appWidth, appHeight);
//
//Display Orientation: a few comparisons for IFs
//Computer tells us the orientation, go
String orientation = ( displayWidth >= displayHeight ) ? "Landscape or Square": "Portrait"; 
println("Display Orientation:", orientation); //Verify Veriables
if ( orientation=="Portrait" ) println("Turn your phun");
/*
if ( orientation=="Landscape or Square") 
{
  //Empty IF
} else { 
  println("Turn your phun");
} //FUN 
//
//Variable Population: notice using appWidth & appHeight to move between size() & fullScreen()
smallerDisplayDimension = appHeight; //ALWAYS in Landscape
reset = smallerDisplayDimension / smallerDisplayDimension; //returns "1"
rectFaceX = (appWidth*1/2) - (smallerDisplayDimension*1/2);
rectFaceY =appHeight*0;
rectFaceWidth = smallerDisplayDimension; //Square Shape
rectFaceHeight = smallerDisplayDimension; //Square Shape
faceX = appWidth*1/2;
faceY = appHeight*1/2;
faceDiameter = smallerDisplayDimension;
leftEyeX = appWidth*1.5/4;
leftEyeY = appHeight*1/4;
rightEyeX = appWidth*2.5/4;
rightEyeY = leftEyeY; //Best Practice: change one line of code
eyeDiameter = smallerDisplayDimension*1/4;
mouthX1 = leftEyeX;
mouthY1 = appHeight*3/4;
mouthX2 = rightEyeX;
mouthY2 = mouthY1;
mouthOpen = smallerDisplayDimension*1/4;
xNose1 = faceX;
yNose1 = leftEyeY;
xNose2 = faceX - leftEyeY*1/2;
yNose2 = faceY;
xNose3 = faceX + leftEyeY*1/2;
yNose3 = faceY ;
//
//Face: Circle = Inscribing a Circle in a Square
//Center a circle on display orientation
//rect(rectFaceX, rectFaceY, rectFaceWidth, rectFaceHeight);
fill(#FFF5F0);
ellipse(faceX, faceY, faceDiameter, faceDiameter);
//

} //End setup
//
void draw() 
{
  //background(200);
 // background(#000000);
  PVector mouseVector = new PVector(mouseX, mouseY);

  PVector leftPupil = leftEye.copy().add(mouseVector.copy().sub(leftEye).setMag(20)) ;
  PVector rightPupil = rightEye.copy().add(mouseVector.copy().sub(rightEye).setMag(20));
 //

 smooth();
noStroke();
fill(#D80B0B);
beginShape();
vertex(50, 15);
bezierVertex(50, -5, 10, 5, 50, 40);
vertex(50, 15);
bezierVertex(50, -5, 10, 5, 50, 40);
endShape();

//
//Measle
float measleDiameter = random(smallerDisplayDimension*1/100 , smallerDisplayDimension*1/25); //Range of measle size: small=*1/100, large=4xbigger (*1/25)
float measleRadius = measleDiameter*1/2;
println (measleRadius);
float measleX = random( rectFaceX+measleRadius, ( ( rectFaceX+rectFaceWidth) - measleRadius) );
float measleY = random( rectFaceY+measleRadius, ( ( rectFaceY+rectFaceHeight) - measleRadius) );
Boolean nightMode=false; //Note: IF-ELSE similar to ternary operator
//color red=#FF0000, measleColour=red, whiteReset=#000000;
color measleColour = ( nightMode==false ) ? color ( 255, random(0,50), random(120) ) : color ( 255, random(0,50), 0 ) ; //ternary operator for day:night
color whiteReset=#FFFFFF; // Note: need ranger here too
//
float measleRectX = measleX-measleDiameter*1/2;
float measleRectY = measleY-measleDiameter*1/2;
float measleWidth = measleDiameter;
float measleHeight = measleDiameter;
//rect( measleRectX, measleRectY, measleWidth, measleHeight);
//random values given other variables (similar to button code)
noStroke(); //Shape outline
fill(measleColour);
ellipse( measleX, measleY, measleDiameter, measleDiameter );
stroke(reset);
fill(whiteReset); //reset to first colour (i.e blackReset
////Left Eye
//rect(leftEyeX-eyeDiameter*1/2, leftEyeY-eyeDiameter*1/2, eyeDiameter, eyeDiameter);
ellipse(leftEyeX, leftEyeY, eyeDiameter, eyeDiameter);
//
//Right Eye
//rect(rightEyeX-eyeDiameter*1/2, rightEyeY-eyeDiameter*1/2, eyeDiameter, eyeDiameter);
ellipse(rightEyeX, rightEyeY, eyeDiameter, eyeDiameter);
//
 //eyes
  fill(#0F6719);
  ellipse(leftEye.x, leftEye.y, 300, 300);
  ellipse(rightEye.x+150, rightEye.y+0, 300, 300);
  fill(0);
  ellipse(leftPupil.x, leftPupil.y, 200, 200);
  ellipse(rightPupil.x+150, rightPupil.y+10, 200, 200);
  //
//Nose
fill(#FFDF24);

//rect(xNose2, yNose1, xNose3-xNose2, yNose3-yNose1);
triangle(xNose1, yNose1, xNose2, yNose2, xNose3, yNose3);
//
fill(#F04D5B);
 arc(1370, 1335, 1050, 1200, 0, 9.14);
//Mouth
fill(#F04D5B);
int mouthWidth = int (mouthX2 - mouthX1);
int mouthHeight = mouthOpen;
//rect(mouthX1-mouthOpen*1/2, mouthY1-mouthOpen*1/2, mouthWidth+mouthOpen, mouthHeight);
strokeWeight(mouthOpen); //testing: 100=400/4 mouthOpen=height*1/4
line(mouthX1, mouthY1, mouthX2, mouthY2);
strokeWeight(reset); //reset to 1 pixel
//
fill(#E38ECE);
 arc(1370, 1335, 1050, 900, 0, 3.14);
} //End draw
//
void keyPressed() {} //End keypressed
//
void mousePressed() {} //End mousePressed
//
//End Main Program



*/
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "MeasleProject" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
