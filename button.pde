
/*

 image(board, 0, 0,400,400);
 image(button, 50,290,60,55); // ROW 1
 image(button, 120,290,60,55);
 image(button, 190,290,60,55);
 image(button, 260,290,60,55);
 image(button,330,290,60,55);
 
 
 
 image(button, 50,150,60,55); // ROW 3
 image(button, 120,150,60,55);
 image(button, 190,150,60,55);
 image(button, 260,150,60,55);
 image(button,330,150,60,55);
 
 image(button, 50,80,60,55); // ROW 4
 image(button, 120,80,60,55);
 image(button, 190,80,60,55);
 image(button, 260,80,60,55);
 image(button,330,80,60,55);
 
 
 image(button, 50,10,60,55); // ROW 5
 image(button, 120,10,60,55);
 image(button, 190,10,60,55);
 image(button, 260,10,60,55);
 image(button,330,10,60,55);
 */

void display_button(int x )
{
  switch(x)
  {
    case 0:
    image(button, 160, 580, 30, 27); // ROW 1

    break;
  case 1:
    image(button, 15, 445, 60, 55); // ROW 1

    break;
  case 2:
    image(button, 100, 445, 60, 55);

    break;
  case 3:
    image(button, 185, 445, 60, 55);

    break;
  case 4:
    image(button, 270, 445, 60, 55);
    break;
  case 5:
    image(button, 270, 370, 60, 55);
    break;
  case 6:

    image(button, 185,  370, 60, 55);
    break;
  case 7:

    image(button,  100,  370, 60, 55);
    break;
  case 8:

    image(button, 15,  370, 60, 55);
    break;
  case 9:

    image(button, 15, 300, 60, 55);
    break;
  case 10:
    image(button, 100, 300, 60, 55); // ROW 2
    break;
  case 11:
    image(button, 185, 300, 60, 55); // ROW 3

    break;
  case 12:
    image(button, 270, 300, 60, 55);

    break;
  case 13:
    image(button, 270, 225, 60, 55);

    break;
  case 14:
    image(button,185, 225, 60, 55);

    break;
  case 15:
    image(button,  100, 225, 60, 55);
    break;
  case 16:

    image(button,15, 225,60, 55);
    break;
  case 17:

    image(button, 15, 155, 60, 55);
    break;
  case 18:

    image(button,  100,  155, 60, 55);
    break;
  case 19:

    image(button, 185, 155, 60, 55);
    break;

  case 20:
    image(button, 270, 155, 60, 55); // ROW 4
    break;
  case 21:
    image(button, 270, 80, 60, 55); // ROW 5

    break;
  case 22:
    image(button, 185, 80, 60, 55);

    break;
  case 23:
    image(button,  100, 80, 60, 55);

    break;
  case 24:
    image(button, 15, 80, 60, 55);

    break;
  case 25:
    image(button, 270, 10, 60, 55);
    break;
  default:
    break;
  }
}


void draw_dice()
{



fill(255);
 

    switch(dice_no[dice_count])
  {
    case 1:

circle(310, 548, 10);
break;
case 2:

circle(300, 540, 10);
circle(320, 560, 10);
break;
case 3:

circle(310, 540, 10);
circle(300,560, 10);
circle(320, 560, 10);
break;
case 4:
circle(300, 540, 10);
circle(320, 540, 10);
circle(300, 560, 10);
circle(320, 560, 10);
break;
case 5:
circle(300, 540, 10);
circle(320, 540, 10);
circle(300, 560, 10);
circle(320, 560, 10);
circle(310, 550, 10);
break;
case 6:
circle(320, 535, 10);
circle(320, 550, 10);
circle(320, 565, 10);

circle(300, 535, 10);
circle(300, 550, 10);
circle(300, 565, 10);

break;

default:
break;

  }
  
}

void roll_dice()
{
   ready_for_roll=false;
for(int k=0;k<50;k++)
  dice_no[k]=int(random(1,7));
  
no_iterations= int(random(0,50));
dice_count=0;

if(state==COMPUTER)
{
state=COMPUTER_MOVE;
movement_done=false;

}else if(state==HUMAN)
state=HUMAN_MOVE;



data_send=false;
ready_for_roll=false;

}




void print_turn()
{
fill(200,0,0);
textFont(Fedorka);
textSize(45);
 if(state==HUMAN)
 text("YOUR TURN",10, 570);
 else if(state==COMPUTER)
 {
  textSize(28);
  text("COMPUTER'S TURN ", 10, 565);
  }
  if (rectOver) {
   fill(170,0,0);
 } else {
  fill(200,0,0);
 }

rect(285,525,50,50,10);
draw_dice();
}


void make_the_move()
{  
  if(data_send==false)
  {

if(computer_pos+dice_no[no_iterations] >25)
computer_pos=computer_pos;
else if(computer_pos>0)
{
  println(computer_pos);
  println("MOVING");
computer_pos+=dice_no[no_iterations];
println(computer_pos);
}

if(computer_pos==8)
computer_pos=10;
else if(computer_pos==13)
computer_pos=5;
else if(computer_pos==3)
computer_pos=18;
else if(computer_pos==24)
computer_pos=3;
else if(computer_pos==21)
computer_pos=19;
if(computer_pos==0 &&dice_no[no_iterations]==1)
computer_pos=1;
 data_send=true;
 
   }
}

void print_rolling()
{
 fill(0,200,0);
 textFont(Fedorka);
 textSize(50);
text("ROLLING",30, 570 );
fill(0,200,0);
rect(285,525,50,50,10);
draw_dice();
  
}
