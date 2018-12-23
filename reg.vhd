library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity reg is
port (data_in : in std_logic_vector(7 downto 0);
		data_out : out std_logic_vector(7 downto 0);
		E,CLK : in std_logic);
end reg;
architecture beh of reg is
signal data : std_logic_vector(7 downto 0);
begin 
process(E,CLK)
begin
if(rising_edge(CLk)) then
	if(E='1') then
		data <= data_in;
	end if;
	data_out <= data;
end if;
end process;
end beh;