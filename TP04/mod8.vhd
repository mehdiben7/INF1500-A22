----------------------------------------------------------------------------------
-- Company: Polytechnique Montréal
-- Engineer: Mehdi Benouhoud, Vincent Drolet
-- 
-- Create Date: 11/04/2022 03:27:57 PM
-- Design Name: 5 bits mod 8 operator
-- Module Name: mod8 - Behavioral
-- Project Name: TP04 - INF1500
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mod8 is
    Port ( E : in STD_LOGIC_VECTOR (4 downto 0);
           S : out STD_LOGIC_VECTOR (4 downto 0));
end mod8;

architecture Behavioral of mod8 is

begin

S(4) <= '0';
S(3) <= '0';
S(2) <= E(2);
S(1) <= E(1);
S(0) <= E(0);

end Behavioral;
