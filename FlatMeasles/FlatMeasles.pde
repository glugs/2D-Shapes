//Global Variables
int smallerDisplayDimension;
float rectFaceX, rectFaceY, rectFaceWidth, rectFaceHeight;
float faceX, faceY, faceDiameter;
float leftEyeX, leftEyeY, rightEyeX, rightEyeY, eyeDiameter;
float mouthX1, mouthX2, mouthY1, mouthY2;
//
//Display Geometry
fullScreen(); //displayWidth displayHeight
//Landscape, not square or portrait
println(displayWidth, displayHeight); //Verification Values
//Display Orientation
//Computer tells us the orientation, important for cell phone orientation
//if(width>= height) {prinln("landscape or square":"portrait");} else{println("portrait");}
String orientation= (width>= height) ? "Landscape or Square": "Portrait";//Ternary operator, repeats IF-ELSE
println("Display Orientation:", orientation);//Verify variables
if (orientation=="Portrait") println("Turn your phun");
/*
if (orientation=="Landscape or Square" ) {
  //Empty IF
} else {
  println("Turn your phun");//FUN
}
*/





//
//Variable Population
smallerDisplayDimension=height;//Smaller dimension is always height in landscape
rectFaceX= (width*1/2) - (smallerDisplayDimension*1/2);
rectFaceY= height*0;
rectFaceWidth=smallerDisplayDimension;//Square Shape
rectFaceHeight=smallerDisplayDimension;//Square shape
faceX=width*1/2;
faceY= height*1/2;
faceDiameter = smallerDisplayDimension;
leftEyeX= width*3/8;
rightEyeX= width*5/8;
leftEyeY=height*1/4;
rightEyeY=leftEyeY;//Best Practice: change one line of code
eyeDiameter= smallerDisplayDimension*1/4;
mouthX1= leftEyeX;
mouthY1= width*3/4;
mouthX2= rightEyeX;
mouthY2= mouthY1; 
//
//Face: Cirlce=Inscibing a Circle in a square
//Center a circle on a display orientation
rect(rectFaceX, rectFaceY, rectFaceWidth, rectFaceHeight);
ellipse(faceX, faceY, faceDiameter, faceDiameter);
//
//Left Eye
//rect();
ellipse(leftEyeX, leftEyeY, eyeDiameter, eyeDiameter);
//
//Right Eye
//rect();
ellipse(rightEyeX, rightEyeY, eyeDiameter, eyeDiameter);
//
//Nose
//rect();
triangle(xNose1, yNose1, xNose2, yNose2, xNose3, yNose3);
//
//Mouth
//rect();
line(mouthX1, mouthY1, mouthX2, mouthY2);
//
//Measle
//rect();
//
//Measle
