----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2022 02:43:46 PM
-- Design Name: 
-- Module Name: FSM_RPC - Behavioral
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

entity FSM_RPC is
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
end FSM_RPC;

architecture Behavioral of FSM_RPC is
    type GAME_STATE is (IDLE, PLAYER1, PLAYER2, RESULT);
    -- type GAME_SIGN IS (ROCK, PAPER, SCISSORS, NONE); REACTIVATE IF USEFUL
   
    signal STATE, NEXT_STATE : GAME_STATE;
    
    
begin

-- Partie séquentielle - Implémentation registre
    process(CLK, RST)
    begin
        if(CLK='1' and CLK'event) then
            -- For each clock rising edge
            if(RST='1') then -- If Reset -> go back to initial state
                            -- Falls inside even if another button is pressed
                STATE <= IDLE;
                NEXT_STATE <= PLAYER1;
            elsif(V='1') then -- If V is pressed, go to next state
                if(STATE=RESULT) then
                    STATE <= IDLE; -- If already at result, go back to initial state
                    NEXT_STATE <= PLAYER1; -- New "next state" is Player 1
                else
                    STATE <= NEXT_STATE; -- Otherwise go to next state
                end if;
                
            end if;
        end if;
        
    end process;
-- FIN - Partie séquentielle - Implémentation registre



end Behavioral;
