----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2022 12:42:43
-- Design Name: 
-- Module Name: gestAffichage - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gestAffichage is
    Port ( CLK : in STD_LOGIC;
           MOD_SEL : out STD_LOGIC_VECTOR (1 downto 0);
           UNIT_SEL : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0));
end gestAffichage;

architecture Behavioral of gestAffichage is
    signal count : std_logic_vector(18 downto 0) := "0000000000000000000";
begin
process(clk)
begin
    if (clk'event and clk = '1') then
        count <= std_logic_vector(unsigned(count)+1);
    end if;
end process;

MOD_SEL <= count(18 downto 17);
UNIT_SEL <= count(16);
AN <= "11111111" xor std_logic_vector(to_unsigned(1,8) sll to_integer(unsigned(count(18 downto 16))));

end Behavioral;
