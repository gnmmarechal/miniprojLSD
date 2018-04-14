library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

entity Timer is
	port( clk	:	in	std_logic;
			reset	:	in	std_logic;
			startPause	:	in	std_logic;
			hasEnded	:	out	std_logic;
			counterOut	:	out	std_logic_vector(11 downto 0));
			
end Timer;

architecture Behavioral of Timer is
	signal s_count		:	unsigned(11 downto 0) := "111000010000"; -- 59:59
	signal s_hasEnded	:	std_logic;
	signal s_enabled	:	std_logic;
	
begin
	process (clk)
	
	begin
		if	(rising_edge(clk)) then
			
			if (reset = '1') then -- Se houver pedido de reset, pára o timer, define o valor para 59:59
				s_enabled <= '0';
				s_hasEnded <= '0';
				s_count <= "111000010000";
			elsif (s_hasEnded = '0') then
				if (s_enabled = '1') then -- Contar
					s_count <= s_count - 1;
				end if;
				if (startPause = '1') then -- Parar a contagem
					s_enabled <= not s_enabled;
				end if;
			end if;
			if (s_count = "000000000001") then
				s_hasEnded <= '1';
			end if;
		end if;
	end process;
	hasEnded <= std_logic(s_hasEnded);
	counterOut <= std_logic_vector(s_count);
end Behavioral;