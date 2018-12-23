library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity rom is 
port (data_in : in std_logic_vector(7 downto 0);
		sig_in : in std_logic;
		addr_in : in std_logic_vector(7 downto 0);
		data_out,addr_out: out std_logic_vector(7 downto 0);
		RW,E : in std_logic);
end rom;
architecture beh of rom is
type MEM is array(0 to 255) of std_logic_vector(7 downto 0);
signal addr : std_logic_vector(7 downto 0) := (others=>'1');
begin
process(E,RW)
variable memory : MEM;
begin
memory(0) := "00010000";
memory(1) := "00010100";
memory(2) := "00010100";
memory(3) := "01000111";
memory(4) := "00101000";
memory(5) := "00000011";
memory(6) := "01000001";
memory(7) := "10100010";
memory(8) := "10110010";
memory(9) := "11000000";
memory(10) := "10000100";
memory(11) := "10011000";
memory(12) := "00110000";
memory(13) := "00001111";
memory(15) := "11100000";
if(falling_edge(sig_in)) then
	addr <= addr + "00000001";
end if;
if(E='0') then
	if(RW='0') then
		data_out <= memory(CONV_INTEGER(addr_in));
	elsif(RW='1') then
		memory(CONV_INTEgER(addr)) := data_in;
	end if;
end if;
end process;
addr_out <= addr;
end beh;