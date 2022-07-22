----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:17:47 05/09/2021 
-- Design Name: 
-- Module Name:    SSD_enable - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SSD_enable is
    Port ( clk,rst : in  STD_LOGIC;
			  en : out STD_LOGIC_VECTOR (7 downto 0);
           SSD : out  STD_LOGIC_VECTOR (6 downto 0));
end SSD_enable;

architecture Behavioral of SSD_enable is

component MOD10Counter 
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component Clk_1Hz 
    Port ( clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component;

component SevenSegmentDecoder 
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           X : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

signal clk1Hz : STD_LOGIC;
signal S0,S1 :  STD_LOGIC_VECTOR (3 downto 0);
signal counter :  STD_LOGIC_VECTOR (15 downto 0);
signal SSD0,SSD1 :  STD_LOGIC_VECTOR (6 downto 0);

begin

X1: Clk_1Hz port map (clk,clk1Hz);
X2: SevenSegmentDecoder port map (S0,SSD0);
X3: SevenSegmentDecoder port map (S1,SSD1);

--counter
process(clk1Hz,rst)  
begin

if rst='1' then
S0 <= (others=>'0');
S1 <= (others=>'0');


elsif (rising_edge(clk1Hz) and rst='0') then 
S0 <= S0+1;
		if S0= "1001" then
		S0 <= (others=>'0');
		S1 <= S1+1;
		if S1= "0001" then
		S1 <= (others=>'0');
		end if;
		end if;

end if;
end process;


--enable shifitng 
process(clk,rst)
begin
if rst='1' then
counter <= (others=>'0');

elsif (rising_edge(clk) and rst='0') then
counter <= counter+1;

end if;

case counter(15) is 
when '0' => en <= "11111110"; SSD<= SSD0;
when '1' => en <= "11111101"; SSD<= SSD1;
when others => en <= "11111111";
end case;

end process;

end Behavioral;
