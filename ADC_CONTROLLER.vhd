library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ADC_CONTROLLER is 

		port ( 
				clk_in : in std_logic ;
				INT_not  : in std_logic;
				clr  : in std_logic;
				RD_not: out std_logic
				);
		end ADC_CONTROLLER ;
		
		
		
architecture logic_controlling_INTnot_and_RDnot  of ADC_CONTROLLER is 

	begin 
		--clock_divider 
		process(clk_in,INT_not,clr )
		begin 

			--if (clk_in'event and clk_in='1') then 
			
				if(INT_not<='0') then 
					RD_not<='1';
				else 
					RD_not<='0';
				end if ; 
			
			--end if;
			
			
		end process;
		
		
		
	end logic_controlling_INTnot_and_RDnot ;