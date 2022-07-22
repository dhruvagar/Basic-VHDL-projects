----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:15:45 04/09/2021 
-- Design Name: 
-- Module Name:    Counter5bit - Behavioral 
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

entity Counter5bit is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ss : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (4 downto 0));
end Counter5bit;

architecture Behavioral of Counter5bit is
signal counter : STD_LOGIC_VECTOR (4 downto 0);

begin

process(clk,rst)
begin

if rst='1' then
counter <= (others=>'0');

elsif ss='0' then
counter <= counter;

elsif (rising_edge(clk) and rst='0') then
counter <= counter+1;

end if;
end process;
q<=counter;
end Behavioral;

