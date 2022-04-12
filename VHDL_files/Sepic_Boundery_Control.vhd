library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Sepic_Boundery_Control IS

--UART transmiter


			generic (


scale_ferquincy: integer:=5208);--scale_ferquincy=(50M/2^bit_number)/9600

 --50M/128000=
			



	Port(
			START : IN STD_LOGIC;
			clk_50 :in std_logic;			
			CNT_CLEAR: IN STD_LOGIC;--
			DATA:IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			Data_sent : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			TxD :OUT STD_LOGIC;
			TX_FLAG_FLAG : OUT STD_LOGIC
			
			
		  
		  
		  );
end Sepic_Boundery_Control;



ARCHITECTURE Transmiter OF Sepic_Boundery_Control IS 
			SIGNAL COUNTER : INTEGER RANGE 0 TO (5208) :=0; --מונה לספירת הזמן עבור שידור ביט בודד 
				-- ferquincy_clock [HZ]/ 9600 [BitPerSecond]
			SIGNAL BIT_PLACE : INTEGER RANGE 0 TO 9:=0 ; -- מצביע על מיקום הסיבית 
			SIGNAL DATA_REGISTER : STD_LOGIC_VECTOR(9 DOWNTO 0) ;--אוגר המכיל פריימ לטובת שידור 
			
			SIGNAL TX_FLAG : STD_LOGIC:='0';-- דגל המסמן תחילת שידור 
			SIGNAL CNT : INTEGER RANGE 0 TO 1 :=0 ;--מונה המשמש למניעת רטוטים 
	
			
			
BEGIN 
	PROCESS(clk_50,START)
		BEGIN 
		IF(clk_50' EVENT AND CLK_50='1') THEN 
			--מונה לטבת השייה,כדי שלא נשדר אותו מידע מספר פעמים 
				IF (CNT_CLEAR='0') then 
				CNT<=0; --תנאי לאיפוס מונה 
				END IF;
				
				IF (( TX_FLAG='0' AND START ='0' ) AND (CNT=0)) THEN 
				TX_FLAG<='1'; --מסמנים תחילת שידור 
				
				DATA_REGISTER(0) <='0'; --מיקןם של הביט ההתחלתי שערכו 0 לוגי 
				DATA_REGISTER(9)<='1'; -- מיקם של הביט סטופ שערכו 1 לוגי 
				DATA_REGISTER(8 DOWNTO 1) <=DATA;--הדאטה שאנו רוצים להעביר 
				Data_sent<= DATA_REGISTER(8 DOWNTO 1);
				TX_FLAG_FLAG<=TX_FLAG;
				END IF;
				
				IF(TX_FLAG='1') THEN --במידה והתחלנו שידור 
					IF (COUNTER <5208) THEN --תנאי לקידום המונה 
						COUNTER<=COUNTER+1;
					ELSE
					COUNTER<=0;
				END IF;
					
					
				IF(COUNTER=2600 ) THEN --במחצית של זמן שידור ביט בודד 
					TxD<= DATA_REGISTER(BIT_PLACE);-- DATA_REGISTER משדרים ביט בודד מ
					
						IF(BIT_PLACE<9) THEN --תנאי לסיפרת הביטים ששדירנו 
							BIT_PLACE<=BIT_PLACE+1;
						ELSE 
						TX_FLAG<='0';--איפוס דגל 
						BIT_PLACE<=0; -- איפוס מצביע 
						CNT<=CNT+1;-- קידום מונה למניעת ריטוטים 
						
						END IF;
				END IF;
				
			END IF;
		END IF;
			
	END PROCESS;
		
		
	END  Transmiter;
				
				
				
				