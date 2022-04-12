library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



ENTITY SWITCH_test_Block IS



PORT (

	clk_in : IN STD_LOGIC;
	clr  :   IN STD_LOGIC;
	
	
	
	SWITCHES_data: IN std_logic_vector(7 downto 0);
	LEDS         : OUT std_logic_vector(7 downto 0);
	HEX4_off     : OUT std_logic_vector(6 downto 0) := "1111111";
	HEX3_off     : OUT std_logic_vector(6 downto 0) := "1111111"


    );
END SWITCH_test_Block;


ARCHITECTURE Behavioral_SWITCH_test_Block OF SWITCH_test_Block IS 


BEGIN 


switch_data_test_0 :PROCESS (clk_in,clr )


	BEGIN 
IF (clk_in'event and clk_in='1') THEN 
		IF (SWITCHES_data(0) ='0') THEN 
			LEDS(0)<='0';
		ELSE 
			LEDS(0)<='1';
		END IF ;
END IF ;	
END PROCESS switch_data_test_0;




switch_data_test_1 :PROCESS (clk_in,clr )
BEGIN
IF (clk_in'event and clk_in='1') THEN 
		IF (SWITCHES_data(1) ='0') THEN 
			LEDS(1)<='0';
		ELSE 
			LEDS(1)<='1';
		END IF ;
END IF ;	

END PROCESS switch_data_test_1;


switch_data_test_2 :PROCESS (clk_in,clr )
BEGIN
IF (clk_in'event and clk_in='1') THEN 
		IF (SWITCHES_data(2) ='0') THEN 
			LEDS(2)<='0';
		ELSE 
			LEDS(2)<='1';
		END IF ;
END IF ;	
END PROCESS switch_data_test_2;







switch_data_test_3 :PROCESS (clk_in,clr )
BEGIN
IF (clk_in'event and clk_in='1') THEN 
		IF (SWITCHES_data(3) ='0') THEN 
			LEDS(3)<='0';
		ELSE 
			LEDS(3)<='1';
		END IF ;
END IF ;	
END PROCESS switch_data_test_3;




switch_data_test_4 :PROCESS (clk_in,clr )
BEGIN
IF (clk_in'event and clk_in='1') THEN 
		IF (SWITCHES_data(4) ='0') THEN 
			LEDS(4)<='0';
		ELSE 
			LEDS(4)<='1';
		END IF ;
END IF ;	
END PROCESS switch_data_test_4;

	
switch_data_test_5 :PROCESS (clk_in,clr )
BEGIN
IF (clk_in'event and clk_in='1') THEN 
		IF (SWITCHES_data(5) ='0') THEN 
			LEDS(5)<='0';
		ELSE 
			LEDS(5)<='1';
		END IF ;
END IF ;	
END PROCESS switch_data_test_5;




switch_data_test_6 :PROCESS (clk_in,clr )
BEGIN
IF (clk_in'event and clk_in='1') THEN 
		IF (SWITCHES_data(6) ='0') THEN 
			LEDS(6)<='0';
		ELSE 
			LEDS(6)<='1';
		END IF ;
END IF ;	
END PROCESS switch_data_test_6;





switch_data_test_7 :PROCESS (clk_in,clr )
BEGIN
IF (clk_in'event and clk_in='1') THEN 
		IF (SWITCHES_data(7) ='0') THEN 
			LEDS(7)<='0';
		ELSE 
			LEDS(7)<='1';
		END IF ;
END IF ;	
END PROCESS switch_data_test_7;
	
	

END Behavioral_SWITCH_test_Block;