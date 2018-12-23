library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity regset is
port (data_in : in std_logic_vector(7 downto 0);
		data_out : out std_logic_vector(7 downto 0);
		W,R : in std_logic;
		crl : in std_logic_vector(1 downto 0);
		CLK : in std_logic);
end regset;
architecture beh of regset is
begin
process(W,R,crl,CLK)
variable data_A,data_B,data_c,data_D : std_logic_vector(7 downto 0);
begin
if(rising_edge(CLk)) then
	if(W='1' and R='0') then
		case crl is
		when "00" => data_A := data_in;
		when "01" => data_B := data_in;
		when "10" => data_C := data_in;
		when "11" => data_D := data_in;
		when others=> NULL;
		end case;
	elsif(W='0' and R='1') then
		case crl is
		when "00" => data_out <= data_A;
		when "01" => data_out <= data_B;
		when "10" => data_out <= data_C;
		when "11" => data_out <= data_D;
		when others=> NULL;
		end case;
	else
		data_out <= (others=>'Z');
	end if;
end if;
end process;
end beh;

	