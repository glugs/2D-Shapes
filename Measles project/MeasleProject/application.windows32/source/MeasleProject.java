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

int red = 0xffF01313, white = 0xffFFFFFF, blue = 0xff63B5EA,cream=0xffFFEFCE, pink = 0xffF5C1E0, darkPink = 0xffFC82CC, lightgreen=0xff92E5A0 ;
int buttonColour, measlesColor = red; 
float measlesDiameter, measlesBoxX, measlesBoxY;
float measles3X, measles3Y, measles3X2, measles3Y2, measles4X, measles4Y, measles4X2, measles4Y2, measles5X, measles5Y;
int buttonX, buttonY, buttonWidth, buttonHeight, button2X, button2Y, button3X, button3Y;
Boolean measlesOn=false, eyesOn=false;
PVector leftEye;
float rectXPic1, rectYPic1, rectWidthPic1, rectHeightPic1;
PImage pic1;
int black=0xff000000;
float imageWidthRatioPic1=0.0f, imageHeightRatioPic1=0.0f;
Boolean widthPic1Larger=false, heightPic1Larger=false;
int largerPic1Dimension, smallerPic1Dimension;
float pic1WidthAdjusted, pic1HeightAdjusted;
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
float angleRotate;


//
//float rectXPic1, rectYPic1, rectWidthPic1, rectHeightPic1;
//PImage pic1;


//
public void setup() 
{
//
  buttonX = width*43/50;
  buttonY = height*1/9;
  button2X = buttonX;
  button2Y = height*19/50;
  button3X = buttonX;
  button3Y = height*13/20;
  buttonWidth = height*1/6;
  buttonHeight = height*1/8;
 background(0xff96F0ED);
 //

  //
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

 pic1 = loadImage("190726-fever-guide-gif.jpg"); //Dimensions: width 1920, height 1280
   int pic1Width = 606;
   int pic1Height = 3000;
   //Choosing larger image dimension
if (pic1Width >= pic1Height) { //ID Larger Dimension: Landscape and Square
  largerPic1Dimension = pic1Width;
  smallerPic1Dimension = pic1Height;
  widthPic1Larger = true;
} else { //ID Larger Dimension: Portrait
  largerPic1Dimension = pic1Height;
  smallerPic1Dimension = pic1Width;
  heightPic1Larger = true;
} //End pic1 larger dimension ID
println (smallerPic1Dimension, largerPic1Dimension);
//Calculating Aspect Ratios
//Note:single line IF's can be summarized to IF-ELSE or IFELSEIF-ELSE
if (widthPic1Larger == true) imageWidthRatioPic1 = PApplet.parseFloat(largerPic1Dimension) / PApplet.parseFloat(largerPic1Dimension);
if (widthPic1Larger == true ) imageHeightRatioPic1 = PApplet.parseFloat(smallerPic1Dimension) / PApplet.parseFloat(largerPic1Dimension);
if ( heightPic1Larger == true) imageWidthRatioPic1 = PApplet.parseFloat(smallerPic1Dimension) / PApplet.parseFloat(largerPic1Dimension);
if ( heightPic1Larger == true) imageHeightRatioPic1 = PApplet.parseFloat(largerPic1Dimension) / PApplet.parseFloat(largerPic1Dimension);
 println (imageWidthRatioPic1, imageHeightRatioPic1);
 //Using ratios to change the image, width, and height properties of rectangle
rectXPic1 = displayWidth*0;
rectYPic1 = displayHeight*1/1090;
rectWidthPic1 = displayWidth*1/2;
rectHeightPic1 = displayHeight*1/2;
pic1WidthAdjusted = rectWidthPic1 * imageWidthRatioPic1;
pic1HeightAdjusted = rectHeightPic1 * imageHeightRatioPic1;
println(pic1Width, pic1Height);
println( pic1WidthAdjusted, pic1HeightAdjusted);
//
} //End setup
public void draw() {

  button1();
  button1text();
  button2();
  button2text();
  button3();
  button3text();
  face();

  //rect(rectXPic1, rectYPic1, rectWidthPic1, rectHeightPic1); 
image(pic1, rectXPic1+(rectXPic1 * 0.48f), rectYPic1+(6), pic1WidthAdjusted, pic1HeightAdjusted);
strokeWeight(0);
  stroke(0xffFFF5F0);

  pushMatrix();
  float angle1 = radians(45);
  translate(100, 180);
  rotate(angle1);
  fill(0xff000000);
  text("101°F",490, 300);
  popMatrix();
  // 


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

measles();
//

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
 fill(0xffFFF5F0);
   reset();
fill(0xffE38ECE);

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
 public void keyPressed() 
 {
   if (key == 'q' || key == 'Q') exit();
 } //End keypressed
//
 public void mousePressed() 
 {
     eyesOn = false;
    measlesOn = false;
   if ( mouseX>buttonX && mouseX<buttonX+buttonWidth && mouseY>buttonY && mouseY<buttonY+buttonHeight) measlesOn = true;
  if ( mouseX>button2X && mouseX<button2X+buttonWidth && mouseY>button2Y && mouseY<button2Y+buttonHeight) measlesOn = false;
  if ( mouseX>button3X && mouseX<button3X+buttonWidth && mouseY>button3Y && mouseY<button3Y+buttonHeight) exit();
 } //End mousePressed
//
//End Main Program
public void button1() {
  if (mouseX>buttonX && mouseX<buttonX+buttonWidth && mouseY>buttonY && mouseY<buttonY+buttonHeight) { 
    buttonColour = cream;
  } else { 
    buttonColour = lightgreen;
  } //End If
  fill(buttonColour);
  rect(buttonX, buttonY, buttonWidth, buttonHeight);
  fill(white);
}

public void button2() {
  if (mouseX>button2X && mouseX<button2X+buttonWidth && mouseY>button2Y && mouseY<button2Y+buttonHeight) { 
    buttonColour = cream;
  } else { 
    buttonColour = lightgreen;
  } //End If
  fill(buttonColour);
  rect(button2X, button2Y, buttonWidth, buttonHeight);
  fill(white);
}

public void button3() {
  if (mouseX>button3X && mouseX<button3X+buttonWidth && mouseY>button3Y && mouseY<button3Y+buttonHeight) { 
    buttonColour = cream;
  } else { 
    buttonColour = lightgreen;
  } //End If
  fill(buttonColour);
  rect(button3X, button3Y, buttonWidth, buttonHeight);
  fill(white);
}
String buttonText= "Let's go :)";
String button2Text= "Clear";
String button3Text= "Cheerio! ";

public void title() {
  titleFont = createFont ("BodoniMTBlack-Italic-48", 55);
  fill(black);
  textFont(titleFont, 70);
  text(title, titleX, titleY, titleWidth, titleHeight);
  fill(white);
}

public void buttonFormat() {
  fill(black);
  textAlign (CENTER, CENTER);
  textFont(titleFont, 50);
}

public void button1text() {
  buttonFormat();
  text(buttonText, buttonX, buttonY, buttonWidth, buttonHeight);
  fill(white);
}

public void button2text() {
  buttonFormat();
  text(button2Text, button2X, button2Y, buttonWidth, buttonHeight);
  fill(white);
}

public void button3text() {
  buttonFormat();
  text(button3Text, button3X, button3Y, buttonWidth, buttonHeight);
  fill(white);}
public void measlesBox() {
  measlesDiameter = random(height*1/30, height*1/15);
  measlesBoxX = random(faceX+measlesDiameter/2, faceX+faceDiameter-measlesDiameter/2);
  measlesBoxY = random(faceY+measlesDiameter/2, faceY+faceDiameter-measlesDiameter/2);
  //
  fill(measlesColor);
  ellipse(measlesBoxX, measlesBoxY, measlesDiameter, measlesDiameter);
  fill(white);
}
public void face() {
  
  
  
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
 

}

public void measles() {
//Measle
 if (measlesOn == true) {
 //
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
 }
}
public void reset() {
  if (measlesOn == false) {
  ellipse(faceX, faceY, faceDiameter, faceDiameter);
  face();
  
  }
}
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
