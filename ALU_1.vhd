library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity ALU_1 is
port(data_A : in std_logic_vector(7 downto 0);
	  data_B : in std_logic_vector(7 downto 0);
	  M : in std_logic_vector(3 downto 0);
	  E,C1,CLK : in std_logic;
	  data_out : out std_logic_vector(7 downto 0);
	  C2 : out std_logic);
end ALU_1;
architecture beh of ALU_1 is
signal data_A_out,data_B_out : std_logic_vector(7 downto 0);
component FA
port (data_A : in std_logic_vector(7 downto 0);
		data_B : in std_logic_vector(7 downto 0);
		C1 : in std_logic;
		E : in std_logic;
		data_out : out std_logic_vector(7 downto 0);
		C2 : out std_logic);
end component;
component logic
port (data_A : in std_logic_vector(7 downto 0);
		data_B : in std_logic_vector(7 downto 0);
		data_A_out : out std_logic_vector(7 downto 0);
		data_B_out : out std_logic_vector(7 downto 0);
		M : in std_logic_vector(3 downto 0);
		E,CLK : in std_logic);
end component;
begin
lo:logic 
port map(data_A => data_A,data_B => data_B,M=>M,E=>E,CLK=>CLK,data_A_out=>data_A_out,data_B_out=>data_B_out);
add:FA
port map(data_A => data_A_out,data_B => data_B_out,C1=>C1,E=>E,data_out=>data_out,C2=>C2);
end beh;