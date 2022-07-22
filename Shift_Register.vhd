----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:40:21 05/05/2021 
-- Design Name: 
-- Module Name:    Shift_Register - Behavioral 
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

entity Shift_Register is
    Port ( input : in  STD_LOGIC;
			  clk : in  STD_LOGIC;
			  rst	: in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end Shift_Register;

architecture Behavioral of Shift_Register is
component Clk_1Hz 
    Port ( clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component;

signal output_t : STD_LOGIC_VECTOR (3 downto 0);
signal clock :  STD_LOGIC;

begin

X0: Clk_1Hz PORT MAP (clk , clock);

process(clock,rst)
begin

if(rising_edge(clock) and rst='1') then
output_t <= (others=>'0');

elsif (rising_edge(clk) and rst='0') then
output_t <= output_t(2 downto 0) & input;

end if;

end process;
output <= output_t;

end Behavioral;
