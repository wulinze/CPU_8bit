library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity sp is
port (data_in : in std_logic_vector(7 downto 0);
		data_out : out std_logic_vector(7 downto 0);
		E,CLK : in std_logic);
end sp;
architecture beh of sp is
signal data : std_logic_vector(7 downto 0); 
begin
process(CLK,E)
begin
if(E='1') then
if(rising_edge(CLK)) then
data <= data_in;
data_out <= data;
end if;
else data_out <= (others=>'Z');
end if;
end process;
end beh;
