library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity Logic is
port (data_A : in std_logic_vector(7 downto 0);
		data_B : in std_logic_vector(7 downto 0);
		data_A_out : out std_logic_vector(7 downto 0);
		data_B_out : out std_logic_vector(7 downto 0);
		M : in std_logic_vector(3 downto 0);
		E,CLK : in std_logic);
end Logic;
architecture beh of Logic is
begin
process(E,CLK,M)
begin
if(E='1') then
	if(rising_edge(CLK)) then
		case M is
		when "0000" => data_A_out <= data_A and data_B;data_B_out<= "00000000";--and
		when "0001" => data_A_out <= data_A or data_B;data_B_out<= "00000000";--or
		when "0010" => data_A_out <= data_A xor data_B;data_B_out<= "00000000";--xor
		when "0011" => data_A_out <= not data_A;data_B_out<= "00000000";--not A
		when "0100" => data_B_out <= not data_B;data_A_out<= "00000000";--not B
		when "0101" => data_A_out <= data_A;data_B_out <= data_B;--ADD A,B
		when "0110" => data_A_out <= (not data_A) + "00000001";data_B_out <= data_B;--B SUB A
		when "0111" => data_A_out <=  data_A;data_B_out <= (not data_B) + "00000001";--A SUB B
		when "1000" => data_A_out <= data_A(6 downto 0)&data_A(7);data_B_out<= "00000000";--SHL A
		when "1001" => data_B_out <= data_B(6 downto 0)&data_B(7);data_A_out<= "00000000";--SHL B
		when "1010" => data_A_out <= data_A(0)&data_A(7 downto 1);data_B_out<= "00000000";--SHR A
		when "1011" => data_B_out <= data_B(0)&data_B(7 downto 1);data_A_out<= "00000000";--SHR B
		when others => data_A_out <= (others=>'Z');data_B_out <= (others=>'Z');
		end case;
	end if;
else data_A_out <= (others=>'Z');data_B_out <= (others=>'Z');
end if;
end process;
end beh;
		