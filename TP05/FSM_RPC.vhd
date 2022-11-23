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
    type GAME_SIGN IS (ROCK, PAPER, SCISSORS, NONE);
   
    signal STATE, NEXT_STATE : GAME_STATE;
    signal SELECTED_GAME_SIGN : GAME_SIGN;
    signal GAME_SIGN_DISPLAY_VECTOR : STD_LOGIC_VECTOR (4 downto 0);
    
begin

-- Partie séquentielle - Implémentation registre
    process(CLK, RST)
    begin
    
        if(CLK='1' and CLK'event) then
            if(RST='1') then 
                --state <= state_0;
                STATE <= IDLE;
            elsif (V='1' and STATE=IDLE) then
                STATE <= PLAYER1;
            elsif (V='1' and STATE=PLAYER1) then
                STATE <= PLAYER2;
            elsif (R='1' and (STATE = PLAYER1 OR STATE = PLAYER2)) then
                SELECTED_GAME_SIGN <= ROCK;
                GAME_SIGN_DISPLAY_VECTOR <= "10000";
            elsif (P='1' and (STATE = PLAYER1 OR STATE = PLAYER2)) then
                SELECTED_GAME_SIGN <= PAPER;
                GAME_SIGN_DISPLAY_VECTOR <= "10001";
            elsif (C='1' and (STATE = PLAYER1 OR STATE = PLAYER2)) then
                SELECTED_GAME_SIGN <= SCISSORS;
                GAME_SIGN_DISPLAY_VECTOR <= "10010";
            
            
                --state <= next_state;
            end if;
        end if;
    end process;
-- FIN - Partie séquentielle - Implémentation registre

process(STATE, V)
begin
    case STATE is
        when IDLE =>
        Disp0 <= "11110";
        Disp1 <= "11110";
        Disp2 <= "11110";
        Disp3 <= "11110";
        Disp4 <= "11110";
        Disp5 <= "11110";
        Disp6 <= "11110";
        Disp7 <= "11110";
        
        when PLAYER1 =>
        
        
        Disp7 <= "10001";
        Disp6 <= "00001";
        Disp5 <= "11111";
        Disp4 <= "11111";
        
        Disp3 <= GAME_SIGN_DISPLAY_VECTOR;
        Disp2 <= GAME_SIGN_DISPLAY_VECTOR;
        Disp1 <= GAME_SIGN_DISPLAY_VECTOR;
        Disp0 <= GAME_SIGN_DISPLAY_VECTOR;
        when PLAYER2 =>
        
        Disp7 <= "10001";
        Disp6 <= "00010";
        Disp5 <= "11111";
        Disp4 <= "11111";
        
        Disp3 <= GAME_SIGN_DISPLAY_VECTOR;
        Disp2 <= GAME_SIGN_DISPLAY_VECTOR;
        Disp1 <= GAME_SIGN_DISPLAY_VECTOR;
        Disp0 <= GAME_SIGN_DISPLAY_VECTOR;
        
        when RESULT =>
    end case;
        
end process;

end Behavioral;
