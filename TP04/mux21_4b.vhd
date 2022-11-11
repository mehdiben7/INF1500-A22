----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2022 04:32:47 PM
-- Design Name: 
-- Module Name: mux21_4b - Behavioral
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

entity mux21_4b is
    Port ( E0 : in STD_LOGIC_VECTOR (3 downto 0);
           E1 : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end mux21_4b;

architecture Behavioral of mux21_4b is

begin

with Sel select S <=
    E0 when '0',
    E1 when '1',
    "0000" when others;


end Behavioral;
