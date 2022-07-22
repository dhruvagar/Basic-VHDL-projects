----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:59:39 05/08/2021 
-- Design Name: 
-- Module Name:    FIFO - Behavioral 
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

entity FIFO is
    Port ( input : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           E : out  STD_LOGIC;
           HF : out  STD_LOGIC;
			  F : out  STD_LOGIC;
           HE : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end FIFO;

architecture Behavioral of FIFO is

type data_type is array (0 to 8) of std_logic_vector(3 downto 0);
signal output_t : data_type;
signal counter : integer:=0;
begin

process(clk)
begin

if( rst='1') then
output_t(0 to 8) <= (others=>"0000");
counter <= 0;
HF <= '0';
F <= '0';
HE <= '0';
E <= '0';

elsif (rising_edge(clk) and rst='0') then
output_t(1 to 8) <= output_t(0 to 7);
output_t(0) <=input;
counter <= counter +1;

output <= output_t(8);
end if;

if counter = 15 then
counter <= 0;
end if;

if counter = 3 then
HF <= '1';
end if;
if counter = 4 then
HF <= '0';
end if;

if counter = 7 then
F <= '1';
end if;
if counter = 8 then
F <= '0';
end if;

if counter = 11 then
HE <= '1';
end if;
if counter = 12 then
HE <= '1';
end if;

if counter = 15 then
E <= '1';
end if;
if counter = 0 then
E <= '0';
end if;

end process;


end Behavioral;
