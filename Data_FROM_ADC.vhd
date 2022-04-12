


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;


ENTITY Data_FROM_ADC IS


						GENERIC ( display_resulation: INTEGER :=7);		-- counter to get to 97KHz ferquincy 


PORT (

	clk_50 : IN STD_LOGIC;
	clr  :   IN STD_LOGIC;
	
	
	
	DATA_IN_BINARY_form: IN std_logic_vector(display_resulation downto 0);
	A1,B1 : IN integer RANGE 0 TO 80 ;
	Y1 : out INTEGER RANGE 0 TO 80 ;
	
		hundreds_digit_DISPLAY : OUT std_logic_vector (6 downto 0 );
		tens_digit_DISPLAY     : OUT std_logic_vector (6 downto 0 );
		unity_digit_DISPLAY    : OUT std_logic_vector (6 downto 0 )
	
	
	
	
	

    );
END Data_FROM_ADC;


ARCHITECTURE Behavioral_Data_FROM_ADC OF Data_FROM_ADC IS

Signal DATA_IN_DEC_form :integer range 0 to 255;
Signal HUNDRED :integer range 0 to 2;
Signal TENS :integer range 0 to 9;
Signal ONES :integer range 0 to 9;



	BEGIN 

	
	
	BINARY_2_DC: PROCESS(clk_50)
		BEGIN 
		
--		DATA_IN_DEC_form<=(DATA_IN_BINARY_form(7)*2);
		Y1<=A1*B1;
		
		
		
		
	END PROCESS BINARY_2_DC;

--				DATA_IN_INT<=conv_integer(DATA_IN_BINARY_form);
--
--		Seven_Sigment_Display_of_ADC_INPUT_DATA :PROCESS(clk_50,DATA_IN_INT)
--		BEGIN 
--	
--									if(clk_50'event and clk_50='1') then
--
--											ONES <=	DATA_IN_INT MOD 10;	-- the unity number 
--											TENS <=(DATA_IN_INT MOD 100-ONES)/10;   -- the tens number 
--											HUNDRED <= (DATA_IN_INT-DATA_IN_INT MOD 100)/100;
--										
--									
--								
--								
--								
--										case  TENS is -----TENS NUMBER DISPLAY
--
--										when 0 => TENS_digit_DISPLAY  <="0000001"; -- "0" 
--										when 1 => TENS_digit_DISPLAY  <="1001111"; -- "1" 
--										when 2 => TENS_digit_DISPLAY  <="0010010"; -- "2" 
--										when 3 => TENS_digit_DISPLAY <="0000110"; -- "3"
--										when 4 => TENS_digit_DISPLAY  <="1001100"; -- "4" 
--										when 5 => TENS_digit_DISPLAY  <="0100100"; -- "5" 
--										when 6 => TENS_digit_DISPLAY <="0100000"; -- "6" 
--										when 7 => TENS_digit_DISPLAY  <="0001111"; -- "7" 
--										when 8 => TENS_digit_DISPLAY  <="0000000"; -- "8" 
--										when 9 => TENS_digit_DISPLAY  <="0000100"; -- "9" 
--									
--
--										when others =>  unity_digit_DISPLAY   <= (others => '0');
--		
--										end case;
--											
--								
--								
--										
--										
--										case  ONES is -----ONES NUMBER DISPLAY
--
--										when 0 => unity_digit_DISPLAY  <="0000001"; -- "0" 
--										when 1 => unity_digit_DISPLAY  <="1001111"; -- "1" 
--										when 2 => unity_digit_DISPLAY  <="0010010"; -- "2" 
--										when 3 => unity_digit_DISPLAY <="0000110"; -- "3"
--										when 4 => unity_digit_DISPLAY  <="1001100"; -- "4" 
--										when 5 => unity_digit_DISPLAY  <="0100100"; -- "5" 
--										when 6 => unity_digit_DISPLAY <="0100000"; -- "6" 
--										when 7 => unity_digit_DISPLAY  <="0001111"; -- "7" 
--										when 8 => unity_digit_DISPLAY  <="0000000"; -- "8" 
--										when 9 => unity_digit_DISPLAY  <="0000100"; -- "9" 
--									
--
--										when others =>  unity_digit_DISPLAY   <= (others => '0');
--		
--										end case;
--										
--										
--										case  HUNDRED is ----HUNDREED  NUMBER DISPLAY
--
--										when 0 => hundreds_digit_DISPLAY    <="0000001"; -- "0" 
--										when 1 => hundreds_digit_DISPLAY  	<="1001111"; -- "1" 
--										when 2 => hundreds_digit_DISPLAY    <="0010010"; -- "2" 									
--										
--										
--										when others =>  hundreds_digit_DISPLAY   <= (others => '0');
--										
--										end case;
--										
--										
--										
--										
--								
--								
--											
--											
--											
--											
--									END IF ;
--											
--											
--		
--		--DATA_OUT <=conv_std_logic_vector(HUNDRED ,8);
--		
--		END PROCESS Seven_Sigment_Display_of_ADC_INPUT_DATA;
	



END Behavioral_Data_FROM_ADC;