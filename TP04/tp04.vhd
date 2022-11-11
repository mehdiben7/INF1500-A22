----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2022 04:51:50 PM
-- Design Name: 
-- Module Name: tp04 - Behavioral
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

entity tp04 is
    Port ( A : in STD_LOGIC_VECTOR (4 downto 0);
           CLK : in STD_LOGIC;
           SEVEN_SEG : out STD_LOGIC_VECTOR (7 downto 0);
           AN : out STD_LOGIC_VECTOR (7 downto 0));
end tp04;

architecture Behavioral of tp04 is

component mod8 is
    Port ( E : in STD_LOGIC_VECTOR (4 downto 0);
           S : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component complt2 is
    Port ( E : in STD_LOGIC_VECTOR (4 downto 0);
           S : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component mux31_5b is
    Port ( E0 : in STD_LOGIC_VECTOR (4 downto 0);
           E1 : in STD_LOGIC_VECTOR (4 downto 0);
           E2 : in STD_LOGIC_VECTOR (4 downto 0);
           Sel : in STD_LOGIC_VECTOR (1 downto 0);
           S : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component bin2Dec is
    Port ( E : in STD_LOGIC_VECTOR (4 downto 0);
           S0 : out STD_LOGIC_VECTOR (3 downto 0);
           S1 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component mux21_4b is
    Port ( E0 : in STD_LOGIC_VECTOR (3 downto 0);
           E1 : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component bin7Seg is
    Port ( E : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component gestAffichage is
    Port ( CLK : in STD_LOGIC;
           MOD_SEL : out STD_LOGIC_VECTOR (1 downto 0);
           UNIT_SEL : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal sComplt2, sMod8, sMux31_5b : STD_LOGIC_VECTOR (4 downto 0);
signal s0Bin2Dec, s1Bin2Dec, sMux21_4b: STD_LOGIC_VECTOR (3 downto 0);
signal sModSel : STD_LOGIC_VECTOR (1 downto 0);
signal sUnitSel: STD_LOGIC;

begin

    
    Cmp2: complt2 port map(E => A, S => sComplt2);
    Md8: mod8 port map(E => A, S => sMod8);
    GAffichage: gestAffichage port map(CLK => CLK, MOD_SEL => sModSel, UNIT_SEL => sUnitSel, AN => AN);
    M31_5b: mux31_5b port map(E0 => A, E1 => sComplt2, E2 => sMod8, Sel => sModSel, S => sMux31_5b);
    B2Dec: bin2Dec port map(E => sMux31_5b, S0 => s0Bin2Dec, S1 => s1Bin2Dec);
    M21_4b: mux21_4b port map(E0 => s0Bin2Dec, E1 => s1Bin2Dec, Sel => sUnitSel, S => sMux21_4b);
    B7Seg: bin7Seg port map(E => sMux21_4b, S => SEVEN_SEG);
    


end Behavioral;
