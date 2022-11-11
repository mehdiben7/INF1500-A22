----------------------------------------------------------------------------------
-- Company: Polytechnique Montréal
-- Engineer: Mehdi Benouhoud, Vincent Drolet
-- 
-- Create Date: 11/04/2022 04:14:08 PM
-- Design Name: 4 bits binary to decimal converter
-- Module Name: bin2Dec - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bin2Dec is
    Port ( E : in STD_LOGIC_VECTOR (4 downto 0);
           S0 : out STD_LOGIC_VECTOR (3 downto 0);
           S1 : out STD_LOGIC_VECTOR (3 downto 0));
end bin2Dec;

architecture Behavioral of bin2Dec is

begin

S0 <= STD_LOGIC_VECTOR(RESIZE(unsigned(E) mod 10, 4));
S1 <= STD_LOGIC_VECTOR(RESIZE(unsigned(E) / 10, 4));


end Behavioral;
