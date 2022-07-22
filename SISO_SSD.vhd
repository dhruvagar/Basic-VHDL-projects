----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:42:45 05/28/2021 
-- Design Name: 
-- Module Name:    SISO_SSD - Behavioral 
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

entity SISO_SSD is
    Port ( input : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  en : out STD_LOGIC_VECTOR (7 downto 0);			  
           SSD : out  STD_LOGIC_VECTOR (6 downto 0));
end SISO_SSD;

architecture Behavioral of SISO_SSD is

component SevenSegmentDecoder 
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           X : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

component SISO 
    Port ( input : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           output : out  STD_LOGIC);
end component;

component Clk_1Hz 
    Port ( clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component;

signal S0,freq : STD_LOGIC;
signal output : STD_LOGIC_VECTOR (3 downto 0);

begin

X0: Clk_1Hz PORT MAP (clk , freq);
X1: SISO port map (input,freq,rst,S0);
X2: SevenSegmentDecoder port map (output,SSD);


output <= "000" & S0;
en <= "11111110";

end Behavioral;

