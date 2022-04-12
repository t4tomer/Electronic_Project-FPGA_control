Library IEEE;
USE IEEE.Std_logic_1164.all;

entity DFF_8bit is 
   port(
      Q_0,Q_1,Q_2,Q_3,Q_4,Q_5,Q_6,Q_7 : out std_logic;    
      Clk :in std_logic;   
      D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7 :in  std_logic    
   );
end DFF_8bit;




architecture Behavioral of DFF_8bit is  
begin  
 D_0_bit:process(Clk)
 begin 
    if(rising_edge(Clk)) then
   Q_0 <= D_0; 
    end if;       
 end process D_0_bit;  
 
 
 
 
  D_1_bit:process(Clk)
 begin 
    if(rising_edge(Clk)) then
   Q_1 <= D_1; 
    end if;       
 end process D_1_bit;  
 
 
  D_2_bit:process(Clk)
 begin 
    if(rising_edge(Clk)) then
   Q_2 <= D_2; 
    end if;       
 end process D_2_bit;  
 
 
  D_3_bit:process(Clk)
 begin 
    if(rising_edge(Clk)) then
   Q_3 <= D_3; 
    end if;       
 end process D_3_bit;  
 
 
 

 
 
  D_4_bit:process(Clk)
 begin 
    if(rising_edge(Clk)) then
   Q_4 <= D_4; 
    end if;       
 end process D_4_bit; 
 
 
 
 
  D_5_bit:process(Clk)
 begin 
    if(rising_edge(Clk)) then
   Q_5 <= D_5; 
    end if;       
 end process D_5_bit;  
 
 
 
  D_6_bit:process(Clk)
 begin 
    if(rising_edge(Clk)) then
   Q_6 <= D_6; 
    end if;       
 end process D_6_bit;  
 
 
 
  D_7_bit:process(Clk)
 begin 
    if(rising_edge(Clk)) then
   Q_7 <= D_7; 
    end if;       
 end process D_7_bit; 


 
end Behavioral; 