

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SMramzor is port (
clk, stby: IN std_logic;
r1,y1,g1,r2,g2,y2 : OUT std_logic );
end;

architecture arc of SMramzor is

Type stat_typ is (YY,RY, GR, YR, RG); 

Signal cur_state, next_state:stat_typ;
Begin

Process(clk)
Begin

if (stby ='1') then
r1 <='0'; r2<='0'; y1<='1'; y2<='1'; g1<='0'; g2<='0';
elsif	falling_edge(clk) then  
Case cur_state is
     When YY => r1<='0'; r2<='0'; y1<='1'; y2<='1'; g1<='0'; g2<='0';
 next_state <=RY;
 
     When RG => r1<='1'; r2<='0'; y1<='0'; y2<='0'; g1<='0'; g2<='1';
next_state <= RY; 

     When RY => r1<='1'; r2<='0'; y1<='0'; y2<='1'; g1<='0'; g2<='0';
next_state <=GR; 

	When GR => r1<='0'; r2<='1'; y1<='0'; y2<='0'; g1<='1'; g2<='0';
next_state <=YR;
		  
	When YR => r1<='0'; r2<='1'; y1<='1'; y2<='0'; g1<='0'; g2<='0';
next_state <= RG;
 
when others => r1<='0'; r2<='0'; y1<='0'; y2<='0'; g1<='0'; g2<='0';
next_state <= YY;
	  
End case;
end if;
End process;
End;
