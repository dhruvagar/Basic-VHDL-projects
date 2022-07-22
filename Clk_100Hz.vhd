----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:23:48 05/20/2021 
-- Design Name: 
-- Module Name:    Clk_100Hz - Behavioral 
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

entity Clk_100Hz is
    Port ( clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end Clk_100Hz;

architecture Behavioral of Clk_100Hz is

signal counter : integer := 0;
signal freq : std_logic := '0';

begin
process(clk)
begin
if rising_edge(clk) then
counter <= counter + 1;

if counter = 500000 then
freq <= not freq;
counter <= 0;
end if;
end if;
end process;
q <= freq;
end Behavioral;