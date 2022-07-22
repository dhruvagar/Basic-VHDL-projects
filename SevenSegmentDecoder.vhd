----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:29:33 04/15/2021 
-- Design Name: 
-- Module Name:    SevenSegmentDecoder - Behavioral 
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

entity SevenSegmentDecoder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           X : out  STD_LOGIC_VECTOR (6 downto 0));
end SevenSegmentDecoder;

architecture Behavioral of SevenSegmentDecoder is

begin
process(A)
begin

case A is
when "0000" => X <= "0000001";
when "0001" => X <= "1001111";
when "0010" => X <= "0010010";
when "0011" => X <= "0000110";
when "0100" => X <= "1001100";
when "0101" => X <= "0100100";
when "0110" => X <= "0100000";
when "0111" => X <= "0001111";
when "1000" => X <= "0000000";
when "1001" => X <= "0000100";
when others => X <= "1111111";
end case;
end process;
 
end Behavioral;

