library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity UART_RECEIVER IS






	Port( clk_50 :in std_logic;
		  RxD	 :in std_logic;
		  DATA_out    : out std_logic_vector (7 downto 0 ) 
	);
		  
end UART_RECEIVER;

architecture behave_of_UART_RECEIVER of UART_RECEIVER is 

	SIGNAL DATA_REGISTER : STD_LOGIC_VECTOR (9 downto 0);
	SIGNAL RX_FLAG : STD_LOGIC:='0';
	SIGNAL COUNTER:INTEGER RANGE 0 TO (5208):=0; --מונה לטובת ספירת זמן קליטת ביט בודד 
	SIGNAL BIT_PLACE : INTEGER RANGE 0 TO 9:=0; --מצביע על כתובת של ביט באוגר --
	-- 50,000,000[HZ]/ 9600 [BitPerSecond]=5208
BEGIN 
PROCESS (clk_50)
BEGIN 
	IF( clk_50' EVENT AND CLK_50='1') THEN 
		IF(RX_FLAG='0' AND RxD='0') THEN -- start BIT במצב קליטת 
		
			BIT_PLACE<=0; --איפוס מצביע 
			COUNTER <=0;--איפוס מונה 
			RX_FLAG<='1'; -- התחלת קליטה 
		END IF;
	
		IF(RX_FLAG='1') THEN-- במידה והתחלנו לקלוט 
			DATA_REGISTER(BIT_PLACE) <=RxD;--ביט נכנס לאוגר לפי מיקום 
			
				IF (COUNTER<5207) THEN COUNTER<=COUNTER+1; --קודם מונה לטובת ספירת זמן 
				ELSE COUNTER<=0; --איפוס מונה 
				END IF ;
				
				IF (COUNTER=2500) THEN --במידה ובמחצית זמן קליטת ביט בודד 
					IF(BIT_PLACE<9) THEN --במידה ולא קלטנו 10 ביט 
						BIT_PLACE<=BIT_PLACE+1;
					ELSE
				IF(DATA_REGISTER(0)='0' AND DATA_REGISTER(9)='1') THEN -- FRAME בדיקת תקינות של 
					DATA_out<=DATA_REGISTER(8 DOWNTO 1); --הצגת מידע הנקלט במנורות הלד של הכרטיס 
				ELSE 
				DATA_out<=(OTHERS =>'0');
				END IF;
				
				RX_FLAG<='0'; --איפוס דגל 
						
							END IF;
						END IF;
					END IF;
				END IF;
				END PROCESS;
	
END behave_of_UART_RECEIVER;
				
				
				
				
				
				
				
				
				