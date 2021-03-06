library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;



entity Seven_Segment_Display_From_PC IS
	Port( 
		  clk_50 :in std_logic;
		  DATA_IN    : IN std_logic_vector (7 downto 0 );		  
		 -- DATA_OUT   : OUT std_logic_vector (7 downto 0 );
		  
		  
		  hundreds_digit_DISPLAY : OUT std_logic_vector (6 downto 0 );
		  tens_digit_DISPLAY     : OUT std_logic_vector (6 downto 0 );
		  unity_digit_DISPLAY    : OUT std_logic_vector (6 downto 0 )
	);
	
	
end Seven_Segment_Display_From_PC;


architecture behave_Seven_Segment_Display_Data of Seven_Segment_Display_From_PC is 



	
Signal DATA_IN_INT :integer range 0 to 255;
Signal HUNDRED :integer range 0 to 2;
Signal TENS :integer range 0 to 9;
Signal ONES :integer range 0 to 9;








	BEGIN 
	
				DATA_IN_INT<=conv_integer(DATA_IN);

		CONVERT :PROCESS(clk_50,DATA_IN_INT)
		BEGIN 
	
									if(clk_50'event and clk_50='1') then

											ONES <=	DATA_IN_INT MOD 10;	-- the unity number 
											TENS <=(DATA_IN_INT MOD 100-ONES)/10;   -- the tens number 
											HUNDRED <= (DATA_IN_INT-DATA_IN_INT MOD 100)/100;
										
									
								
								
								
										case  TENS is -----TENS NUMBER DISPLAY

										when 0 => TENS_digit_DISPLAY  <="0000001"; -- "0" 
										when 1 => TENS_digit_DISPLAY  <="1001111"; -- "1" 
										when 2 => TENS_digit_DISPLAY  <="0010010"; -- "2" 
										when 3 => TENS_digit_DISPLAY <="0000110"; -- "3"
										when 4 => TENS_digit_DISPLAY  <="1001100"; -- "4" 
										when 5 => TENS_digit_DISPLAY  <="0100100"; -- "5" 
										when 6 => TENS_digit_DISPLAY <="0100000"; -- "6" 
										when 7 => TENS_digit_DISPLAY  <="0001111"; -- "7" 
										when 8 => TENS_digit_DISPLAY  <="0000000"; -- "8" 
										when 9 => TENS_digit_DISPLAY  <="0000100"; -- "9" 
									

										when others =>  unity_digit_DISPLAY   <= (others => '0');
		
										end case;
											
								
								
										
										
										case  ONES is -----ONES NUMBER DISPLAY

										when 0 => unity_digit_DISPLAY  <="0000001"; -- "0" 
										when 1 => unity_digit_DISPLAY  <="1001111"; -- "1" 
										when 2 => unity_digit_DISPLAY  <="0010010"; -- "2" 
										when 3 => unity_digit_DISPLAY <="0000110"; -- "3"
										when 4 => unity_digit_DISPLAY  <="1001100"; -- "4" 
										when 5 => unity_digit_DISPLAY  <="0100100"; -- "5" 
										when 6 => unity_digit_DISPLAY <="0100000"; -- "6" 
										when 7 => unity_digit_DISPLAY  <="0001111"; -- "7" 
										when 8 => unity_digit_DISPLAY  <="0000000"; -- "8" 
										when 9 => unity_digit_DISPLAY  <="0000100"; -- "9" 
									

										when others =>  unity_digit_DISPLAY   <= (others => '0');
		
										end case;
										
										
										case  HUNDRED is ----HUNDREED  NUMBER DISPLAY

										when 0 => hundreds_digit_DISPLAY    <="0000001"; -- "0" 
										when 1 => hundreds_digit_DISPLAY  	<="1001111"; -- "1" 
										when 2 => hundreds_digit_DISPLAY    <="0010010"; -- "2" 									
										
										
										when others =>  hundreds_digit_DISPLAY   <= (others => '0');
										
										end case;
										
										
										
										
								
								
											
											
											
											
									END IF ;
											
											
		
		--DATA_OUT <=conv_std_logic_vector(HUNDRED ,8);
		
		END PROCESS CONVERT;
	
	
	
	
	END behave_Seven_Segment_Display_Data;
	