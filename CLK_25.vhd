library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity CLK_25 is--时钟分频模块
port(CLK_IN : in std_logic;--输入时钟晶振50mhz
	  CLK_OUT : out std_logic);--输出时钟1hz
end CLK_25;
architecture beh of CLK_25 is
signal CLK : std_logic :='0';
begin
process(CLK_IN)
variable i : integer :=0;
begin
if(rising_edge(CLK_IN)) then
	i := i+1;
	if(i=2500000) then
		i := 0;
		CLK <= not CLK;
	end if;
end if;
CLK_OUT <= CLK;
end process;
end beh;