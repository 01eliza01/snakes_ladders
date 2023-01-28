void send_to_arduino()
{




 
port.write(str(computer_pos)+"\n");
data_in="";

while (!movement_done)
{
if (port.available()>0)
{ // If data is available,
data_in = port.readStringUntil('\n');         // read it and store it in val
  }
  if(data_in!=null)
  {
  data_in=trim(data_in);
  movement_done=data_in.equals("OK");
  }
  println(data_in);
  
}
movement_done=true;


}
