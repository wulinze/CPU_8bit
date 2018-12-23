library ieee;
use ieee.std_logic_1164.all;
entity beat is 
port(CLK : in std_logic;
     beat_condition : out std_logic_vector(9 downto 0);
	  E : in std_logic;
	  C : in std_logic);
end beat;
architecture behave of beat is
signal be : std_logic_vector(9 downto 0);
begin
	  process(E,C,CLK)
	  begin
	  if(E='1') then
			if(c = '0')then
				be <= "0000000001";
			elsif(C = '1' and falling_edge(CLK)) then
				be(9 downto 0) <= be(8 downto 0)&be(9);
			end if;
		else
			be <= (others=>'Z');
		end if;
		end process;
		beat_condition <= be;
end behave;