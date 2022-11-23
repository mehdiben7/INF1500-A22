----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2022 12:02:47 PM
-- Design Name: 
-- Module Name: tp05 - Behavioral
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

entity tp05 is
    Port ( CLK : in STD_LOGIC;
           V : in STD_LOGIC;
           R : in STD_LOGIC;
           P : in STD_LOGIC;
           C : in STD_LOGIC;
           RST : in STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           SEVEN_SEG : out STD_LOGIC_VECTOR (7 downto 0));
end tp05;

architecture Behavioral of tp05 is

component DEBOUNCE is
    Port (
    clk     : IN  STD_LOGIC;  --input clock
    button  : IN  STD_LOGIC;  --input signal to be debounced
    result  : OUT STD_LOGIC); --debounced signal
end component;

component PulseGen is
Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Vin : in STD_LOGIC;
           Vout : out STD_LOGIC);
end component;

component FSM_RPC is 
Port ( CLK : in STD_LOGIC;
           V : in STD_LOGIC;
           R : in STD_LOGIC;
           P : in STD_LOGIC;
           C : in STD_LOGIC;
           RST : in STD_LOGIC;
           Disp0 : out STD_LOGIC_VECTOR (4 downto 0);
           Disp1 : out STD_LOGIC_VECTOR (4 downto 0);
           Disp2 : out STD_LOGIC_VECTOR (4 downto 0);
           Disp3 : out STD_LOGIC_VECTOR (4 downto 0);
           Disp4 : out STD_LOGIC_VECTOR (4 downto 0);
           Disp5 : out STD_LOGIC_VECTOR (4 downto 0);
           Disp6 : out STD_LOGIC_VECTOR (4 downto 0);
           Disp7 : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component gestAffichage is
Port ( CLK : in STD_LOGIC;
           DISP0, DISP1, DISP2, DISP3, DISP4, DISP5, DISP6, DISP7 : in std_logic_vector(4 downto 0);
           SEVEN_SEG : out STD_LOGIC_VECTOR (7 downto 0);
           AN : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal sDebounce, sPulseGen : STD_LOGIC;
signal sDisp0, sDisp1, sDisp2, sDisp3, sDisp4, sDisp5, sDisp6, sDisp7 : STD_LOGIC_VECTOR (4 downto 0);

begin

    DebounceCmpt: DEBOUNCE port map(clk => CLK, button => V, result => sDebounce);
    PulseGenCmpt: PulseGen port map(CLK => CLK, RST => RST, Vin => sDebounce, Vout => sPulseGen);
    FSM_RPCCmpt: FSM_RPC port map(CLK => CLK, V => sPulseGen, R => R, P => P, C => C, RST => RST,
    Disp0 => sDisp0, Disp1 => sDisp1, Disp2 => sDisp2, Disp3 => sDisp3, Disp4 => sDisp4, Disp5 => sDisp5, Disp6 => sDisp6, Disp7 => sDisp7);
    GestAffichageCmpt: gestAffichage port map(DISP0 => sDisp0, DISP1 => sDisp1, DISP2 => sDisp2, DISP3 => sDisp3, DISP4 => sDisp4, DISP5 => sDisp5, DISP6 => sDisp6, DISP7 => sDisp7,
    CLK => CLK, AN => AN, SEVEN_SEG => SEVEN_SEG);
end Behavioral;
