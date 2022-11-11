----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2022 03:11:13 PM
-- Design Name: 
-- Module Name: complt2 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity complt2 is
    Port ( E : in STD_LOGIC_VECTOR (4 downto 0);
           S : out STD_LOGIC_VECTOR (4 downto 0));
end complt2;

architecture Behavioral of complt2 is

signal iE: STD_LOGIC_VECTOR (4 downto 0);

begin

iE(0) <= NOT E(0);
iE(1) <= NOT E(1);
iE(2) <= NOT E(2);
iE(3) <= NOT E(3);
iE(4) <= NOT E(4);

S <= STD_LOGIC_VECTOR( UNSIGNED(iE) + 1);



end Behavioral;
