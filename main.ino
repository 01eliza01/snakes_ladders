void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
pinMode(LED_BUILTIN, OUTPUT);
}

int data_in;

void loop() {
  // put your main code here, to run repeatedly:

if(Serial.available())
{
  data_in=Serial.parseInt(SKIP_ALL, '\n');
  Serial.println(data_in);
  move_to();
  Serial.println("OK");
      
  }
  

  
}
/*Run the following function to make the die move in the cehck board , 

Processing fucntion will wait till it gets a OK message from the arduino to proceed further 
YOu will recieve the block to which the striker to be moved, as per the current code the 
processed data is forwarded to the arduino 

*/

void move_to()
{
  //statements to move the block  from one point to another ... 
  //once this function gets over arduino send OK to processing 
blink_LED(); // blinks the led ,based on data recieved 
  }
  
void blink_LED()
  {
    for (int i=0;i<data_in;i++)
  {
    digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  
  delay(250);                       // wait for a second
  digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
  delay(250);
  } }
