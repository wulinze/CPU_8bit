library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity MAR is
port (data_in : in std_logic_vector(7 downto 0);
		data_out : out std_logic_vector(7 downto 0);
		E,CLK : in std_logic);
end MAR;
architecture beh of MAR is
signal data : std_logic_vector(7 downto 0);
begin 
process(E,CLK)
begin
if(rising_edge(CLk)) then
	if(E='1') then
		data_out <= data_in;
	end if;
end if;
end process;
end beh;