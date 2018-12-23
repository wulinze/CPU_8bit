library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity crl is
port (MOV,MVI,MVA,JMP,SUB,SBB,ADD,ADC,SHL,SHR,AND_IN,OR_IN,XOR_IN,NOT_IN,HALT : in std_logic;
		CLK : in std_logic;
		REG_INFO : in std_logic_vector(3 downto 0);
		beat : in std_logic_vector(9 downto 0);
		CREGS : out std_logic_vector(1 downto 0);
		PCDATA : out std_logic_vector(7 downto 0);
		MALU : out std_logic_vector(3 downto 0);
		EIR,EALU,EMAR,EPC,ESP,EDA,EDB,ER1,ER2,LDPC,INDR,OUTDR,WREGS,RREGS : out std_logic);
end crl;
architecture beh of crl is
begin
process(CLK)
variable n : integer := 0;
variable condition : std_logic_vector(7 downto 0);
variable ALU_op : std_logic;
begin
condition := ADD&SUB&SHL&SHR&AND_IN&OR_IN&XOR_IN&NOT_IN;
ALU_op := ADD or SUB or SHL or SHR or AND_IN or OR_IN or XOR_IN or NOT_IN;
EIR<='0';
EALU<='0';
EMAR<='0';
EPC<='0';
ESP<='0';
EDA<='0';
EDB<='0';
ER1<='0';
ER2<='0';
LDPC<='0';
INDR<='0';
OUTDR<='0';
WREGS<='0';
RREGS<='0';
PCDATA<=(others=>'0');
MALU <= (others=>'0');
if(n=0) then
EMAR <= beat(0) or (beat(7) and MVA);
EPC <= beat(1) or (beat(8) and MVA);
ER1 <= beat(9) and MVA;
INDR <= beat(2) or (beat(9) and MVA);
OUTDR <= beat(3) or beat(4);
ER2<= beat(4) or (beat(8) and ALU_op);
EIR <=beat(6);
RREGS <= ((beat(7) or beat(8)) and ALU_op);
elsif(n=1) then
--OUTDR <= ((beat(0) or beat(1)) and MVA);
--ER2 <= (beat(1) and MVA);
--LDPC <= (beat(3) and MVA);
--EPC <= (beat(3) and MVA);
--EMAR <= (beat(4) and MVA);
--INDR <= (beat(5) and MVA);
--OUTDR <= ((beat(6) or beat(7)) and MVA) or ((beat(0) or beat(1)) and MVA);
--ER2 <= (beat(7) and MVA) or ;
EMAR <= (beat(0) and JMP) or (beat(4) and MVA);
EPC <= ((beat(1) or beat(6)) and JMP) or (beat(3) and MVA);
INDR <= (beat(2) and JMP) or (beat(5) and MVA);
OUTDR <= ((beat(3) or beat(4)) and JMP) or ((beat(6) or beat(7)) and MVA) or ((beat(0) or beat(1)) and MVA);
LDPC<= (beat(6) and JMP) or (beat(3) and MVA);
RREGS <= ((beat(0) or beat(1)) and MOV) or ((beat(1) or beat(2)) and ALU_op);
EDA <= (beat(0) and ALU_op);
ER2 <= (beat(2) and ALU_op) or (beat(1) and MOV) or (beat(4) and JMP) or (beat(1) and MVA) or (beat(7) and MVA);
EDB <= (beat(4) and ALU_op);
elsif(n=2) then
--WREGS <= (beat(0) and MVA);
--ER2 <= (beat(2) and MVA);
--EPC <= (beat(4) and MVA);
LDPC <=(beat(4) and MVA);
ESP <= ((beat(1) or beat(2)) and MVA);
EALU <= ((beat(0) or beat(1)) and ALU_op);
EMAR <= (beat(0) and MVI);
EPC <= (beat(1) and MVI) or (beat(4) and MVA);
INDR <= (beat(2) and MVI);
OUTDR <= ((beat(3) or beat(4)) and MVI);
ER2<= (beat(4) and MVI) or (beat(1) and ALU_op) or (beat(2) and MVA);
WREGS <= (beat(6) and MVI) or (beat(0) and MOV) or (beat(3) and ALU_op) or (beat(0) and MVA); 
--RREGS <= (beat(7) and MVI);
end if;
if(falling_edge(beat(9))) then
	if(HALT='1') then
		n:=3;
	end if;
	if(n=2) then
	 n:=0;
	else n:=n+1;
	end if;
end if;
case condition is
when "10000000" => MALU<= "0101";
when "01000000" => MALU<= "0111";
when "00100000" => MALU<= "1000";
when "00010000" => MALU<= "1010";
when "00001000" => MALU<= "0000";
when "00000100" => MALU<= "0001";
when "00000010" => MALU<= "0010";
when "00000001" => MALU<= "0011";
when others=> MALU <= (others=>'Z');
end case;
if(n=0 or n=2) then
	CREGS <= REG_INFO(3 downto 2);
elsif(n=1) then
	CREGS <= REG_INFO(1 downto 0);
end if;
--if((MVI or MVA or NOT_IN) = '1') then
--	CREGS <= REG_INFO(3 downto 2);
--end if;
end process;
end beh;
