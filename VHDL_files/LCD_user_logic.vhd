LIBRARY ieee;
 USE ieee.std_logic_1164.ALL;
 USE IEEE.STD_LOGIC_ARITH.ALL;
 USE IEEE.STD_LOGIC_UNSIGNED.ALL;

 ENTITY LCD_user_logic IS
 
 
 						GENERIC (display_resolution : INTEGER :=23;   -- counter to get to the lowest ferquncy 
									display_counter: INTEGER :=8);		-- counter to get to 97KHz ferquincy 
 
 PORT(
 
 
 
 
 	lcd_bus_ones : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
--		
		lcd_bus_tens : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
--		
--		testing_up   : IN STD_LOGIC_VECTOR(9 DOWNTO 0);

 
 
 
 
 
 
 --COUNTER_VECTOR :IN  STD_LOGIC_VECTOR(display_counter downto 0);
 lcd_busy : IN STD_LOGIC; --lcd controller busy/idle feedback
 clk : IN STD_LOGIC; --system clock
 lcd_clk : OUT STD_LOGIC;
 reset_n : OUT STD_LOGIC;
 
 
 
 
  lcd_bus_testing : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
 
 lcd_enable : buffer STD_LOGIC; --lcd enable received from lcd controller
 lcd_bus : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)); --data andcontrol signals
 --The MSB is the rs signal, followed by the rw signal.
 -- The other 8 bits are the data bits.
 END lcd_user_logic;

 ARCHITECTURE behavior OF lcd_user_logic IS
 

signal lcd_bus_ones_signal :  STD_LOGIC_VECTOR(display_counter+1 downto 0);
 
 

 BEGIN
 
 --lcd_bus_ones_signal<=lcd_bus_ones;
 
 
 

 
 
 
 
 
 
 

 PROCESS(clk,lcd_bus_ones,lcd_bus_ones_signal,lcd_bus_ones)
 VARIABLE char : INTEGER RANGE 0 TO 12 := 0;
		BEGIN
				IF(clk'EVENT AND clk = '1') THEN
					IF(lcd_busy = '0' AND lcd_enable = '0') THEN
							lcd_enable <= '1';
								IF(char < 12) THEN
										char := char + 1;
										
				END IF;
				
				 
				
				
				
 CASE char IS
				WHEN 1 => lcd_bus <= "1001010000";  --this shows P on the lcd screen 
				WHEN 2 => lcd_bus <= "1001010111";--this shows w on the lcd screen 
				WHEN 3 => lcd_bus <= "1001001101";--this shows m on the lcd screen 
--				WHEN 4 => lcd_bus <= "1000100000";--this shows   on the lcd screen 
---- 
--				WHEN 5 => lcd_bus <= "1001000100";--this shows D on the lcd screen 
--				WHEN 6 => lcd_bus <= "1000101110";--this shows . on the lcd screen 
--				WHEN 7 => lcd_bus <= "1001000011";--this shows C on the lcd screen 
--				WHEN 8 => lcd_bus <= "1000111101";--this shows = on the lcd screen
--					WHEN 9 => lcd_bus <=lcd_bus_tens;
--					WHEN 10 => lcd_bus <=lcd_bus_ones;
					
					

					---------------------------------------------------------------------------this is the test 
					
				  --WHEN 1 => lcd_bus <=lcd_bus_ones_signal;
				--	 WHEN 1 => lcd_bus <=  "1001010000";  --this shows P on the lcd screen 
----------------------------------------------------------------------------------------------------------					
--					WHEN 3 => lcd_bus <=lcd_bus_ones;
					
					
					


 WHEN OTHERS => lcd_enable <= '0';
 END CASE;
 ELSE
 lcd_enable <= '0';
 END IF;
 END IF;
 END PROCESS;
 
 
 
 
 
 

 reset_n <= '1';
 lcd_clk <= clk;
 
 
 
 END behavior;
 
 
 