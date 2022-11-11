----------------------------------------------------------------------------------
-- Company: Polytechnique Montréal
-- Engineer: Mehdi Benouhoud, Vincent Drolet
-- 
-- Create Date: 11/04/2022 03:40:01 PM
-- Design Name: 3 to 1 5 bits multiplexer
-- Module Name: mux31_5b - Behavioral
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

entity mux31_5b is
    Port ( E0 : in STD_LOGIC_VECTOR (4 downto 0);
           E1 : in STD_LOGIC_VECTOR (4 downto 0);
           E2 : in STD_LOGIC_VECTOR (4 downto 0);
           Sel : in STD_LOGIC_VECTOR (1 downto 0);
           S : out STD_LOGIC_VECTOR (4 downto 0));
end mux31_5b;

architecture Behavioral of mux31_5b is

begin
with Sel select S <=
    E0 when "00",
    E1 when "01",
    E2 when "10",
    "00000" when "11",
    "00000" when others;
    


end Behavioral;
