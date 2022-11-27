----------------------------------------------------------------------------------
-- Company: Polytechnique Montréal
-- Engineer: Mehdi Benouhoud, Vincent Drolet
-- 
-- Create Date: 11/18/2022 02:41:08 PM
-- Design Name: Pulse Generator
-- Module Name: PulseGen - Behavioral
-- Project Name: TP05 - INF1500
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

entity PulseGen is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Vin : in STD_LOGIC;
           Vout : out STD_LOGIC);
end PulseGen;

architecture Behavioral of PulseGen is
    type STATE_TYPE is (state_0, state_1);
    signal state: STATE_TYPE;

begin

process(CLK)
begin
    if rising_edge(CLK) then -- Le circuit est synchrone, il ne vaut que si il y a un front montant
        case state is 
            when state_0 => -- Lorsque la sortie est à 0
                if Vin = '1' then -- Si le bouton est actif (est à 1),
                    Vout <= '1'; -- On assigne 1 à la sortie
                    state <= state_1; -- L'état est désormais à 1
                end if;
            when state_1 =>
                if Vin = '1' then -- Si le bouton est actif (est a 1),
                    Vout <= '0'; -- On assigne 0 à la sortie, puisque la sortie ne sera activée que pour un cycle
                    state <= state_1; -- L'état reste donc à 1
                else
                    state <= state_0; -- Sinon, l'état passe à 0
                end if;
        end case;
    end if;
end process;
end architecture;