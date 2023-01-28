import processing.serial.*;
Serial port;    // Create an object from Serial class
String val;     // Data received from the serial port
PFont Fedorka;
PImage board;
PImage button;
int rectX=285;
int rectY=525;
int rectSize = 50;   
boolean rectOver = false;
int no_iterations=0;
int dice_count=0;
int dice_no[] = new int[50];
int COMPUTER =1;
int HUMAN=2;
int COMPUTER_MOVE=3;
int HUMAN_MOVE=4;
boolean game_won=false;
int START=0;
boolean ROLLING=false;
boolean movement_done=false;

boolean wait_for_arduino=true;
boolean auto_play=false;


int state;
boolean data_send=false;
boolean ready_for_roll=true;

int computer_pos=0;
int new_computer_pos=0;

int button_last_pos=0;

String data_in="";

void setup() {
  
    port = new Serial(this, "COM21", 9600);   //define port for Serial communication 
 state=START;
     surface.setTitle("SNAKE N LADDER");
  Fedorka=createFont("Fedorka.ttf", 128);
  dice_no[0]=int(random(1,7));

  size(350,600);
  board = loadImage("board.png");
  button = loadImage("button.png");
  
}


int i;

void draw() {
  update(mouseX, mouseY);
background(255);
 // if ( port.available() > 0)
 // { // If data is available,
// val = port.readStringUntil('\n');         // read it and store it in val
//  }
val="0";
  if(val!=null)
  {
i=Integer.parseInt(val.trim());
  }
 
  
  image(board, 0,0,350,510.125);
  
  if(!ROLLING)
  button_last_pos=computer_pos;
    
  display_button(button_last_pos); 
 


if(state==START)
{
  
  fill(0,0,0);
 textFont(Fedorka);
 textSize(40);
 text("CLICK TO START",10, 570);

}

 

if((state==COMPUTER ||state==HUMAN ) && !ROLLING && ready_for_roll )
{


print_turn();
if(state==COMPUTER && auto_play)
roll_dice();


}

if(ROLLING)
{
if(dice_count%5==0)
print_rolling();
}

if(!ROLLING && state==HUMAN_MOVE )
{
  if(!data_send)
 {println("USERS GAME");
  println(dice_no[no_iterations]);
  data_send=true;
 }
fill(0,0,0);
 textFont(Fedorka);
 textSize(20);
  text("USER GOT",90,547);
 text("CLICK TO CONTINUE ",50, 568);
rect(285,525,50,50,10);
  draw_dice();
  ready_for_roll=true;
}

if(!ROLLING && state==COMPUTER_MOVE  )
{
 if(!data_send)
  { println("COMPUTERS GAME");
  println(dice_no[no_iterations]);
 }fill(0,0,0);
 textFont(Fedorka);
 textSize(20);
 text("COMPUTER GOT",70, 547 );
 text("CLICK TO MOVE ",70, 568);
rect(285,525,50,50,10);
 draw_dice();
make_the_move();
 ready_for_roll=true;
 
}






if(dice_count!= no_iterations)
{  
dice_count++;
ROLLING =true;
}
else
ROLLING= false;

if(auto_play)

{
  if(state==HUMAN_MOVE && dice_no[no_iterations]!=6)
  {  
 
    state=COMPUTER;
  }
  
    if(state==COMPUTER_MOVE  && dice_no[no_iterations]==6)
    {
      
    state=COMPUTER;
    }
   //if(state==COMPUTER) 
    //delay(2000);
}

if(computer_pos==25)
game_won=true;


  //println(val); //print out in the console
}


void update(int x, int y) {
  if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
   } else {
   rectOver = false;
  }
}
boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}


void mousePressed() {
  if (rectOver && (state==HUMAN || state==COMPUTER) && !game_won) {
   roll_dice();
   
  }
  if(state==START)
  {
    state=int(random(1,3));
    
  }
  
  if((state==HUMAN_MOVE ||state==COMPUTER_MOVE ) && ready_for_roll )
  {
    if(state==HUMAN_MOVE && dice_no[no_iterations]==6)
    state=HUMAN;
    if(state==HUMAN_MOVE && dice_no[no_iterations]!=6)
    state=COMPUTER;
    if(state==COMPUTER_MOVE  && dice_no[no_iterations]==6)
    {
      if(!movement_done && computer_pos>0 &&  wait_for_arduino)
      send_to_arduino();
      state=COMPUTER;
        }
    if(state==COMPUTER_MOVE  && dice_no[no_iterations]!=6)
    {
       if(!movement_done && computer_pos>0 &&  wait_for_arduino)
      send_to_arduino();
         state=HUMAN;
    }
    
  }
  
}
