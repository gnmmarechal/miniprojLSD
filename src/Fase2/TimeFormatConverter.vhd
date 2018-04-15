library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

-- Testado com o Waveform.vwf
entity TimeFormatConverter is
	port( b_input		:	in	std_logic_vector(11 downto 0);
			minOut1	:	out std_logic_vector(3 downto 0);
			minOut0	:	out std_logic_vector(3 downto 0);
			secOut1	:	out std_logic_vector(3 downto 0);
			secOut0	:	out std_logic_vector(3 downto 0));
end TimeFormatConverter;

architecture Behavioral of TimeFormatConverter is
	signal s_min0, s_min1, s_sec1, s_sec0, s_value : unsigned (11 downto 0);
	signal s_sobra, s_temp								  : unsigned (11 downto 0);
begin
	s_value <= unsigned(b_input);
	s_temp <= s_value / 60;
	
	-- Minutos
	s_min1 <= s_value / 600; -- Divisão inteira dá o dígito das dezenas dos minutos
	s_min0 <= (s_value / 60) rem 10; -- Dá o resto para dar as unidades dos minutos
	
	-- Segundos
	
	s_sobra <= resize(s_value - ( s_temp * 60), s_sobra'length); -- Importante notar que s_temp * 60 não é igual a s_value devido à divisão inteira
	
	s_sec1 <= s_sobra / 10;
	s_sec0 <= s_sobra rem 10;
	
	-- Finalmente
	
	minOut1 <= std_logic_vector(s_min1(3 downto 0));
	minOut0 <= std_logic_vector(s_min0(3 downto 0));
	
	secOut1 <= std_logic_vector(s_sec1(3 downto 0));
	secOut0 <= std_logic_vector(s_sec0(3 downto 0));
	
	
end Behavioral;