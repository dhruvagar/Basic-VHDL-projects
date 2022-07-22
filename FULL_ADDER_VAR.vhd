----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:26:53 04/24/2021 
-- Design Name: 
-- Module Name:    FULL_ADDER_VAR - Behavioral 
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

entity FULL_ADDER_VAR is
	 Generic (n: integer := 7);
    Port ( A : in  std_logic_VECTOR (n downto 0);
           B : in  std_logic_VECTOR (n downto 0);
           Cin : in  std_logic;
           S : out  std_logic_VECTOR (n downto 0);
           Cout : out  std_logic);
end FULL_ADDER_VAR;

architecture structural of FULL_ADDER_VAR is

SIGNAL U :  std_logic_VECTOR (n+1 downto 0);
begin


U(0) <= Cin;
X1: for i in 0 to n generate --label is important
S(i) <= U(i) XOR (A(i) XOR B(i)) ;
U(i+1) <=(A(i) AND B(i)) OR (A(i) AND U(i)) OR (U(i) AND B(i));
end generate;

Cout <= U(n+1);

end structural;
