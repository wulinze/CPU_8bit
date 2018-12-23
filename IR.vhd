library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity IR is
port (data_in : in std_logic_vector(7 downto 0);
		MOV,MVI,MVA,JMP,SUB,SBB,ADD,ADC,SHL,SHR,AND_OUT,OR_OUT,XOR_OUT,NOT_OUT,HALT : out std_logic;
		REG_INFO : out std_logic_vector(3 downto 0);
		E,CLK : in std_logic);
end IR;
architecture beh of IR is
signal data : std_logic_vector(7 downto 0);
begin
process(E,CLK)
begin
if(E='1') then
	if(rising_edge(CLK)) then 
		data <= data_in;
	end if;
end if;
end process;
process(CLK,data)
begin
	MOV <='0';
	MVI <='0';
	MVA <='0';
	JMP <='0';
	ADD <='0';
	SUB <='0'; 
	ADC <='0'; 
	SBB <='0'; 
	SHL <='0'; 
	SHR <='0';
	AND_OUT <= '0';
	OR_OUT <= '0';
	NOT_OUT <='0';
	XOR_OUT <='0';
	HALT <= '0';
case data(7 downto 4) is
		when "0000" => MOV <='1'; REG_INFO <= data(3 downto 0);
		when "0001" => MVI <='1'; REG_INFO <= data(3 downto 0);
		when "0010" => MVA <='1'; REG_INFO <= data(3 downto 0);
		when "0011" => JMP <='1'; REG_INFO <= (others => '0');
		when "0100" => ADD <='1'; REG_INFO <= data(3 downto 0);
		when "0101" => SUB <='1'; REG_INFO <= data(3 downto 0);
		when "0110" => ADC <='1'; REG_INFO <= data(3 downto 0);
		when "0111" => SBB <='1'; REG_INFO <= data(3 downto 0);
		when "1000" => SHL <='1'; REG_INFO <= data(3 downto 0);
		when "1001" => SHR <='1'; REG_INFO <= data(3 downto 0);
		when "1010" => AND_OUT <= '1'; REG_INFO <= data(3 downto 0);
		when "1011" => OR_OUT <= '1'; REG_INFO <= data(3 downto 0);
		when "1100" => NOT_OUT <='1'; REG_INFO <= data(3 downto 0);
		when "1101" => XOR_OUT <='1'; REG_INFO <= data(3 downto 0);
		when "1110" => HALT <='1'; REG_INFO <= (others => '0');
		when others => NULL;
end case;
end process;
end beh;
