----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2022 04:41:22 PM
-- Design Name: 
-- Module Name: bin7Seg - Behavioral
-- Project Name: 
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

entity bin7Seg is
    Port ( E : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0));
end bin7Seg;

architecture Behavioral of bin7Seg is

begin

with E select S <=
    "11000000" when "0000",
    "11111001" when "0001",
    "10100100" when "0010",
    "10110000" when "0011",
    "10011001" when "0100",
    "10010010" when "0101",
    "10000010" when "0110",
    "11111000" when "0111",
    "10000000" when "1000",
    "10010000" when "1001",
    
    "11111111" when others;


end Behavioral;
