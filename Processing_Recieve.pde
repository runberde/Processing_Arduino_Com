import processing.serial.*;
  
  float val1 = 0;      // sensor 1
  float val2 = 0;      // sensor 2
  float val3 = 0;      // snesor 3
  float val4 = 0;      // sensor 4
  float val5 = 0;      // sensor 5
  
  Serial myPort;
  
  void setup() {
  // setup code goes here!!!!
  
  // List all the available serial ports
  println(Serial.list());
  // I know that the first port in the serial list on my mac
  // is always my  Arduino, so I open Serial.list()[0].
  // Open whatever port is the one you're using.
  myPort = new Serial(this, Serial.list()[1], 9600);
  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');
  }
  
  void draw() {
 // draw code goes here!!!!
  
  void serialEvent(Serial myPort) { 
 // get the ASCII string:
  String inString = myPort.readStringUntil('\n');
  
  if (inString != null) {
  // trim off any whitespace:
  inString = trim(inString);
  // split the string on the commas and convert the 
 // resulting substrings into an integer array:
  float[] sensors = float(split(inString, ","));
  // if the array has at least three elements, you know
  // you got the whole thing.  Put the numbers in the
  // color variables:
  if (sensors.length >=5) {
  // map them to the range 0-255:
  val1 = map(sensors[0], 0, 1023, 0, 255);  //value from sensor 1  
  val2 = map(sensors[1], 0, 1023, 0, 255);  //value from sensor 2
  val3 = map(sensors[3], 0, 1023, 0, 255);  //value from sensor 3
  val4 = map(sensors[4], 0, 1023, 0, 255);  //value from sensor 4
  val5 = map(sensors[5], 0, 1023, 0, 255);  //value from sensor 5
  }
  }
  }
 
