----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:24:39 03/12/2021 
-- Design Name: 
-- Module Name:    SR_LATCH - Behavioral 
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

entity SR_LATCH is
    Port ( S : in  STD_LOGIC;
           R : in  STD_LOGIC;
			  EN : in STD_LOGIC;
           Q : out  STD_LOGIC;
           Qb : out  STD_LOGIC);
end SR_LATCH;

architecture structural of SR_LATCH is
component NAND2_STD
Port ( A : in  STD_LOGIC;
       B : in  STD_LOGIC;
       C : out  STD_LOGIC);
end component;
SIGNAL U,Ub,AS,AR : STD_LOGIC;
begin
X1: NAND2_STD PORT MAP(S,EN,AS);
X2: NAND2_STD PORT MAP(R,EN,AR);
X3: NAND2_STD PORT MAP(AS,Ub,U);
X4: NAND2_STD PORT MAP(AR,U,Ub);
Q <= U;
Qb <= Ub;
end structural;

