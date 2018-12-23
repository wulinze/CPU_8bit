library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
Entity pc is
port (data_in : in std_logic_vector(7 downto 0);
		data_out : out std_logic_vector(7 downto 0);
		LD,E,CLK : in std_logic);
end pc;
architecture beh of pc is
signal data : std_logic_vector(7 downto 0):="00000000";
begin
	process(LD,E,CLk)
	variable step : std_logic_vector(7 downto 0) :="00000001";
	begin
	if(E='1') then
		if(rising_edge(clk)) then
			if(LD='1') then
				data <= data_in;
			else
				data <= data + step;
			end if;
		end if;
	end if;
	data_out <=  data;
	end process;
end beh;
		
