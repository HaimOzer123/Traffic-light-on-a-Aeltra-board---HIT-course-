library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ramzor is
port (
    TEST,STBY,CLOCK: in STD_LOGIC;
	r1,y1,g1,r2,g2,y2: buffer STD_LOGIC);
end;

architecture arc of ramzor is
component Signal_Gen port (
    clk: in STD_LOGIC;
    mode: in STD_LOGIC;
    result: out std_logic);
end component;

component SMramzor port (
clk, stby: IN std_logic;
r1,y1,g1,r2,g2,y2 : OUT std_logic );
end component;

signal clk1 : std_logic;
signal A:std_logic;
begin
clkO: signal_gen port map(CLOCK,A,clk1);
sm: SMramzor port map(STBY,clk1,r1,y1,g1,r2,g2,y2);
process(clock)
begin
if TEST='1' then
	A<='0';
else A<='1'; end if;
end process;
end;
