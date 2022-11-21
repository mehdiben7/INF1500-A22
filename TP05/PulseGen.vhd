----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2022 02:41:08 PM
-- Design Name: 
-- Module Name: PulseGen - Behavioral
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

entity PulseGen is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Vin : in STD_LOGIC;
           Vout : out STD_LOGIC);
end PulseGen;

architecture Behavioral of PulseGen is
    type STATE_TYPE is (state_0, state_1);
    signal state, next_state : STATE_TYPE;

begin

-- Partie séquentielle - Implémentation registre
    process(CLK, RST)
    begin
    
        if(CLK='1' and CLK'event) then
            if(RST='1') then 
                state <= state_0;
            else
                state <= next_state;
            end if;
        end if;
    end process;
-- FIN - Partie séquentielle - Implémentation registre

-- Partie combinatoire - Implémentation de Moore
    process(state, next_state, Vin)
    begin
        case state is
            when state_0 =>
                Vout <= '0';
                if Vin = '1' then
                
                    next_state <= state_1;
                end if;
            when state_1 =>
                Vout <= '1';
                next_state <= state_0;   
                
        end case;
    end process;
-- FIN - Partie combinatoire - Implémentation de Moore

end Behavioral;
