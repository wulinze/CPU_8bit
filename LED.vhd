LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY led IS--led灯译码电路
    PORT(CLK: IN STD_LOGIC;
	      hour_in,minute_in,second_in: IN STD_LOGIC_VECTOR(7 DOWNTO 0);--分别对应小时，分钟，秒钟
			DIG: OUT STD_LOGIC_VECTOR(5 DOWNTO 0);--数码管选通端当为0时对应数码管亮起
         SEG: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));--数字输出
END led;
ARCHITECTURE led_behav OF led IS
--中间信号变量
SIGNAL hourl: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL hourh: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL minl: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL minh: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL secl: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL sech: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL hl,ml,sl: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL hh,mh,sh: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL tem: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL tx: STD_LOGIC_vector(5 downto 0):="111110";
    BEGIN
    PROCESS(CLK)
	 VARIABLE COUNT:INTEGER :=0;
	 BEGIN
	 hourl<=hour_in(3 DOWNTO 0);
	 hourh<=hour_in(7 DOWNTO 4);
	 minl<=minute_in(3 DOWNTO 0);
	 minh<=minute_in(7 DOWNTO 4);
	 secl<=second_in(3 DOWNTO 0);
	 sech<=second_in(7 DOWNTO 4);
	     CASE hourl IS
		      WHEN "0000"=>hl<="11000000";
				WHEN "0001"=>hl<="11111001";
				WHEN "0010"=>hl<="10100100";
				WHEN "0011"=>hl<="10110000";
				WHEN "0100"=>hl<="10011001";
				WHEN "0101"=>hl<="10010010";
				WHEN "0110"=>hl<="10000010";
				WHEN "0111"=>hl<="11111000";
				WHEN "1000"=>hl<="10000000";
				WHEN "1001"=>hl<="10011000";
				WHEN "1010"=>hl<="10001000";
				WHEN "1011"=>hl<="10000011";
				WHEN "1100"=>hl<="11000110";
				WHEN "1101"=>hl<="10100001";
				WHEN "1110"=>hl<="10000110";
				WHEN "1111"=>hl<="10001110";
				WHEN others=>hl<="01111111";
		  END CASE;
	     CASE hourh IS
		      WHEN "0000"=>hh<="11000000";
				WHEN "0001"=>hh<="11111001";
				WHEN "0010"=>hh<="10100100";
				WHEN "0011"=>hh<="10110000";
				WHEN "0100"=>hh<="10011001";
				WHEN "0101"=>hh<="10010010";
				WHEN "0110"=>hh<="10000010";
				WHEN "0111"=>hh<="11111000";
				WHEN "1000"=>hh<="10000000";
				WHEN "1001"=>hh<="10011000";
				WHEN "1010"=>hh<="10001000";
				WHEN "1011"=>hh<="10000011";
				WHEN "1100"=>hh<="11000110";
				WHEN "1101"=>hh<="10100001";
				WHEN "1110"=>hh<="10000110";
				WHEN "1111"=>hh<="10001110";
				WHEN others=>hh<="01111111";
		  END CASE;
		  CASE minl IS
		      WHEN "0000"=>ml<="11000000";
				WHEN "0001"=>ml<="11111001";
				WHEN "0010"=>ml<="10100100";
				WHEN "0011"=>ml<="10110000";
				WHEN "0100"=>ml<="10011001";
				WHEN "0101"=>ml<="10010010";
				WHEN "0110"=>ml<="10000010";
				WHEN "0111"=>ml<="11111000";
				WHEN "1000"=>ml<="10000000";
				WHEN "1001"=>ml<="10011000";
				WHEN "1010"=>ml<="10001000";
				WHEN "1011"=>ml<="10000011";
				WHEN "1100"=>ml<="11000110";
				WHEN "1101"=>ml<="10100001";
				WHEN "1110"=>ml<="10000110";
				WHEN "1111"=>ml<="10001110";
				WHEN others=>ml<="01111111";
		  END CASE;
	     CASE minh IS
		      WHEN "0000"=>mh<="11000000";
				WHEN "0001"=>mh<="11111001";
				WHEN "0010"=>mh<="10100100";
				WHEN "0011"=>mh<="10110000";
				WHEN "0100"=>mh<="10011001";
				WHEN "0101"=>mh<="10010010";
				WHEN "0110"=>mh<="10000010";
				WHEN "0111"=>mh<="11111000";
				WHEN "1000"=>mh<="10000000";
				WHEN "1001"=>mh<="10011000";
				WHEN "1010"=>mh<="10001000";
				WHEN "1011"=>mh<="10000011";
				WHEN "1100"=>mh<="11000110";
				WHEN "1101"=>mh<="10100001";
				WHEN "1110"=>mh<="10000110";
				WHEN "1111"=>mh<="10001110";
				WHEN others=>mh<="01111111";
		  END CASE;
		  CASE secl IS
		      WHEN "0000"=>sl<="11000000";
				WHEN "0001"=>sl<="11111001";
				WHEN "0010"=>sl<="10100100";
				WHEN "0011"=>sl<="10110000";
				WHEN "0100"=>sl<="10011001";
				WHEN "0101"=>sl<="10010010";
				WHEN "0110"=>sl<="10000010";
				WHEN "0111"=>sl<="11111000";
				WHEN "1000"=>sl<="10000000";
				WHEN "1001"=>sl<="10011000";
				WHEN "1010"=>sl<="10001000";
				WHEN "1011"=>sl<="10000011";
				WHEN "1100"=>sl<="11000110";
				WHEN "1101"=>sl<="10100001";
				WHEN "1110"=>sl<="10000110";
				WHEN "1111"=>sl<="10001110";
				WHEN others=>sl<="01111111";
		  END CASE;
	     CASE sech IS
		      WHEN "0000"=>sh<="11000000";
				WHEN "0001"=>sh<="11111001";
				WHEN "0010"=>sh<="10100100";
				WHEN "0011"=>sh<="10110000";
				WHEN "0100"=>sh<="10011001";
				WHEN "0101"=>sh<="10010010";
				WHEN "0110"=>sh<="10000010";
				WHEN "0111"=>sh<="11111000";
				WHEN "1000"=>sh<="10000000";
				WHEN "1001"=>sh<="10011000";
				WHEN "1010"=>sh<="10001000";
				WHEN "1011"=>sh<="10000011";
				WHEN "1100"=>sh<="11000110";
				WHEN "1101"=>sh<="10100001";
				WHEN "1110"=>sh<="10000110";
				WHEN "1111"=>sh<="10001110";
				WHEN others=>sh<="01111111";
		  END CASE;
	     IF(CLK'EVENT AND CLK='1') THEN
		  IF(COUNT=10000)THEN--内部时钟分频
		      tx <= tx(0) & tx(5 downto 1);
				case tx is
				when "111110"=> tem<=sl;
				when "111101"=> tem<=hh;
				when "111011"=> tem<=hl;
				when "110111"=> tem<=mh;
				when "101111"=> tem<=ml;
				when "011111"=> tem<=sh;
				when others=>null;
				end case;
				count:=0;
		  ELSE COUNT:=COUNT+1;
		  END IF;
		  END IF;
    end process;
		  SEG<=tem;
		  DIG<=tx;
    end led_behav;