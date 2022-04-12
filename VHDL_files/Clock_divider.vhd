--clock_divider_look_at_q_table_to_chooce_your_frequency
----q(i)------Frequency(HZ)
----q(i)-------50e6
----q(0)-------25e6 
----q(1)-------12.5e6 
----q(2)-------6.25e6 
----q(3)-------3.125e6
----q(4)-------1.5625e6 
----q(5)-------781.25e3
----q(6)-------390.625e3
----q(7)-------195.3125e3
----q(8)-------97.656e3 
----q(9)-------48.828e3 
----q(10)------24.414e3
----q(11)------12.207e3
----q(12)------6.103e3
----q(13)------3.051e3
----q(14)------1.525e3 
----q(15)------762.94
----q(16)------381.47
----q(17)------190.73 
----q(18)------95.37 
----q(19)------47.68 
----q(20)------23.84
----q(21)------11.92
----q(22)------5.96
----q(23)------2.98
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Clock_divider is 
		GENERIC(		bit_number		:	INTEGER := 13	);	--size of the binary input numbers in bits

		port ( 
				clk_in : in std_logic ;
				clr  : in std_logic;
				clk_out: out std_logic
				);
		end Clock_divider;
		
		
		
architecture logic_clock_divider  of Clock_divider is 
	signal q:std_logic_vector (23 downto 0);
	begin 
		--clock_divider 
		process(clk_in,clr )
		begin 

			if (clk_in'event and clk_in='1') then 
				q<= q+1;
			end if;
		end process;
		
		
		clk_out <=q(bit_number);
		
	end logic_clock_divider ;