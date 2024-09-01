
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Signal_Gen is
port (
    clk: in STD_LOGIC;
    mode: in STD_LOGIC;
    result: out std_logic);
end;
architecture reg of Signal_Gen is
signal y: std_logic:= '0';
signal counter: integer :=0;   
begin
    process (clk) 
    begin
            if falling_edge(clk) then
				   counter<= counter+1;
				   case mode is
					when '0' => 
						if (counter > 50000000) then counter <=0; 
						elsif counter=25000000 then y<='1';
					    else y<='0'; end if;
					when others =>
						if (counter > 50000000*5) then counter <=0;
						elsif counter = 125000000 then y<='1';
							else y<='0'; end if;
				end case; end if;
		result<=y;
    end process;
end reg;
