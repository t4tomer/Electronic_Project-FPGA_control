--https://www.youtube.com/watch?v=VKKGyOc4zRA&t=297s ------> Lesson 34-Binary-to-BCD Converter-for loops
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY binary_2_dec IS
	GENERIC(
		bits		:	INTEGER := 7;		--size of the binary input numbers in bits
		digits	:	INTEGER := 8);		--number of BCD digits to convert to
	PORT(
		b:in std_logic_vector(bits downto 0 ) ;
        Clk :in std_logic;   
		p:out std_logic_vector (digits+1 downto 0 )
		);

END binary_2_dec;

ARCHITECTURE logic OF binary_2_dec IS
	BEGIN 
	  bcd1:process(b,Clk) 
		 variable z : std_logic_vector(17 downto 0);
		 
		BEGIN 
		  IF(clk'event and clk='1') then
			for i in 0 to 17 loop 
				z(i):='0';
			end loop;
			z(10 downto 3):=b;
			
			for i in 0 to 4 loop 
				if z(11 downto 8) > 4 then 
					z(11 downto 8 ) := z(11 downto 8)+3;
				end if ;
				
				if z(15 downto 12) > 4 then 
					z(15 downto 12 ):=z(15 downto 12 ) +3;
				end if ;
				
				z(17 downto 1 ) := z(16 downto 0 ) ;
			end loop;
			
			p<=z(17 downto 8 );
		  END IF ; 	
		end process bcd1;
		
	END logic;






