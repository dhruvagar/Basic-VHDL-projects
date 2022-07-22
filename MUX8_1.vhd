----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:18:47 01/08/2021 
-- Design Name: 
-- Module Name:    MUX8_1 - Behavioral 
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

entity MUX8_1 is
    Port ( A : in bit_VECTOR (7 downto 0);
           S : in bit_VECTOR (2 downto 0);
           X : out bit);
end MUX8_1;

architecture structural of MUX8_1 is
component MUX4_1
Port ( a : in bit_VECTOR (3 downto 0);
       s : in bit_VECTOR (1 downto 0);
       x : out bit);
end component;
component MUX2_1
Port ( A : in  bit;
       B : in  bit;
       S : in  bit;
       X : out  bit);
end component;
SIGNAL U0,U1: bit;	 
begin
X1: MUX4_1 PORT MAP(A(3 downto 0),S(1 downto 0),U0);
X2: MUX4_1 PORT MAP(A(7 downto 4),S(1 downto 0),U1);
X3: MUX2_1 PORT MAP(U0,U1,S(2),X);
end structural;

