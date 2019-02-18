//Module   :  Debounce Logic
//Function :  Validate the input switch pressing.
//            Minimum duration of pressing : 0.4s

module debounce(
input    i_clk,
input    i_swtch,
output   o_pulse
);

reg switch_sync1, switch_sync2;

always @(posedge i_clk)                      //synchronise the switch with system clock
begin 
    switch_sync1   <=  i_swtch;
    switch_sync2   <=  switch_sync1;
end	 

reg [10:0] counter;                              //Counter to validate switch pressing

always @(posedge i_clk)
begin
    if(switch_sync2 & counter < 2000)        //If the switch is pressed, increment counter. To prevent counter overflow, limit
	     counter <= counter + 1;            //the counter to 38 ms.
	 else if(~switch_sync2)                 //When switch is released, reset the counter
        counter <= 0;	 
end

assign o_pulse = (counter == 1200) ? 1'b1 : 1'b0;    //When counter reaches 25ms, generate a pulse.


endmodule
