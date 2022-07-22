----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:05:02 05/08/2021 
-- Design Name: 
-- Module Name:    SISO - Behavioral 
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

entity SISO is
    Port ( input : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           output : out  STD_LOGIC);
end SISO;

architecture Behavioral of SISO is
signal output_t : STD_LOGIC_VECTOR (4 downto 0);
begin

process(clk)
begin

if(rising_edge(clk) and rst='1') then
output_t <= (others=>'0');

elsif (rising_edge(clk) and rst='0') then
output_t(4 downto 1) <= output_t(3 downto 0);
output_t(0) <= input;

end if;

end process;
output <= output_t(4);

end Behavioral;
