----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:06:14 04/24/2021 
-- Design Name: 
-- Module Name:    GreytoBinary - Behavioral 
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

entity GraytoBinary is
generic (n: integer := 4);
    Port ( Gray : in  STD_LOGIC_VECTOR (n-1 downto 0);
           Binary : out  STD_LOGIC_VECTOR (n-1 downto 0));
end GraytoBinary;

architecture Behavioral of GraytoBinary is
signal Binary_temp :  STD_LOGIC_VECTOR (n-1 downto 0); 
begin


Binary_temp(n-1) <= Gray(n-1);

X1: for i in n-2 downto 0 generate
	Binary_temp(i) <= Binary_temp(i+1) XOR Gray(i);
end generate;

Binary <= Binary_temp;

end Behavioral;

