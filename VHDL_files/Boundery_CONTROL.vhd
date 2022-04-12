


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


ENTITY Boundery_CONTROL IS


						GENERIC (Resolution_bits : INTEGER :=7   -- counter to get to the lowest ferquncy 
									);		-- counter to get to 97KHz ferquincy 


PORT (

	clk_in : IN STD_LOGIC;
	clr  :   IN STD_LOGIC;
	
	HESTERESIS_limit: IN std_LOGIC_vector( Resolution_bits downto 0); -- this controling the HISTERSIS limit 
	Input_data : IN std_LOGIC_vector( Resolution_bits downto 0); -- this is the INPUT data from the ADC 
	
	INT_not : IN STD_LOGIC; -- this is the INT_not pin of the MAX153 ADC  ( cheaks when the CONVERSTION is over ) 
	RD_not  : OUT STD_LOGIC; -- this is the RD_not pin of the MAX153 ADC   ( give it '1' to start CONVESTION ) 
	
	
	Out_put_Signal : OUT STD_LOGIC -- this OUTPUT signal to turnon the transistor . 
	
	
	


    );
END Boundery_CONTROL;


ARCHITECTURE Behavioral_0f_ADC_control OF Boundery_CONTROL IS







		BEGIN
	
		

		
--		ADC_CONTROL:PROCESS( Input_data,Out_put_Signal)
--						
--			BEGIN 
--
--			IF (clk_in'event and clk_in='1') THEN -- starting the  counter 
			
--					IF(INT_not<='0') then 
--						RD_not<='1';
--					ELSE RD_not<='0';	
--			
--			END IF;
--			END PROCESS ADC_CONTROL;
		




END Behavioral_0f_ADC_control;