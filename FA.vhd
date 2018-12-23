library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity FA is
port (data_A : in std_logic_vector(7 downto 0);
		data_B : in std_logic_vector(7 downto 0);
		C1 : in std_logic;
		E : in std_logic;
		data_out : out std_logic_vector(7 downto 0);
		C2 : out std_logic);
end FA;
architecture beh of FA is
begin
process(E,C1)
variable i : integer;
variable data : std_logic_vector(7 downto 0);
variable C : std_logic;
begin
if(E='1') then
	C := C1;
add:for i in 0 to 7 loop
		data(i) := data_A(i) xor data_B(i) xor C;
		C := ((data_A(i) or data_B(i)) and C) or (data_A(i) and data_B(i));
	end loop add;
	C2 <= C;
	data_out <= data;
else	data_out <= (others=>'Z');
end if;
end process;
end beh;
	

