----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:06:34 05/08/2021 
-- Design Name: 
-- Module Name:    LIFO - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LIFO is
    Port ( input : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           rd : in  STD_LOGIC;
           wr : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end LIFO;

architecture Behavioral of LIFO is
signal output_t : STD_LOGIC_VECTOR (3 downto 0);
begin

process(clk)
begin

if(rising_edge(clk) and rst='1') then
output_t <= (others=>'0');

elsif (rising_edge(clk) and rst='0' and wr='1') then
output_t <= input & output_t(3 downto 1) ;

elsif (rising_edge(clk) and rst='0' and rd='1') then
output <= output_t;

end if;

end process;


end Behavioral;

