library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
Entity DR is 
port (data_in : in std_logic_vector(7 downto 0);
		data_out : out std_logic_vector(7 downto 0);
		CLK,INDR,OUTDR : in std_logic);
end DR;
architecture beh of DR is
signal data : std_logic_vector(7 downto 0);
begin
process(CLK,INDR,OUTDR)
begin
if(rising_edge(CLK)) then
	if(INDR='1') then
	data<=data_in;
	end if;
end if;
end process;
data_out <= data WHEN OUTDR='1' ELSE "ZZZZZZZZ";
end beh;