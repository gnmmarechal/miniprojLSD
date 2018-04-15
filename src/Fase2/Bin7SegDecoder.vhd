library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity Bin7SegDecoder is
	 port(input 	: in std_logic_vector(3 downto 0); -- input do decoder em binário
			enable	: in std_logic;
			sel		: in std_logic; -- sel = 1 para o dígito das dezenas dos minutos
			decOut_n : out std_logic_vector(6 downto 0)); -- sai o valor para o display
end Bin7SegDecoder;
-- Basicamente o decoder do guião, mas se sel estiver activo e o dígito das dezenas dos minutos for 0, não o mostra (ex. mostra 9:20 em vez de 09:20)
architecture Behavioral of Bin7SegDecoder is
begin

	decOut_n <= "1111111" when (enable   = '0')	  else
					"1000000" when (input = "0000" and sel = '0') else -- 0
					"1111111" when (input = "0000" and sel = '1') else --0 
					"1111001" when (input = "0001") else -- 1
					"0100100" when (input = "0010") else -- 2
					"0110000" when (input = "0011") else -- 3
					"0011001" when (input = "0100") else -- 4
					"0010010" when (input = "0101") else -- 5
					"0000010" when (input = "0110") else -- 6
					"1111000" when (input = "0111") else -- 7
					"0000000" when (input = "1000") else -- 8
					"0010000" when (input = "1001") else -- 9
					"0001000" when (input = "1010") else -- A
					"0000011" when (input = "1011") else -- B
					"1000110" when (input = "1100") else -- C
					"0100001" when (input = "1101") else -- D
					"0000110" when (input = "1110") else -- E
					"0001110" when (input = "1111") else -- F	
					"0000001"; 
end Behavioral;