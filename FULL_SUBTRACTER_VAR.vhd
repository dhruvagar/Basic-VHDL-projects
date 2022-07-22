----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:09:25 05/14/2021 
-- Design Name: 
-- Module Name:    FULL_SUBTRACTER_VAR - Behavioral 
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

entity FULL_SUBTRACTER_VAR is
	 Generic (n: integer := 7);
    Port ( A : in  STD_LOGIC_VECTOR (n downto 0);
           B : in  STD_LOGIC_VECTOR (n downto 0);
           Bin : in  STD_LOGIC;
           D : out  STD_LOGIC_VECTOR (n downto 0);
           Bout : out  STD_LOGIC);
end FULL_SUBTRACTER_VAR;

architecture Behavioral of FULL_SUBTRACTER_VAR is

SIGNAL U :  std_logic_VECTOR (n+1 downto 0);
begin


U(0) <= Bin;
X1: for i in 0 to n generate --label is important
D(i) <= U(i) XOR (A(i) XOR B(i)) ;
U(i+1) <=(not A(i) AND B(i)) OR (not A(i) AND U(i)) OR (U(i) AND B(i));
end generate;

Bout <= U(n+1);

end Behavioral;
