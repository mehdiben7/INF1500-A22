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

    process(CLK, RST)
    begin
            if rising_edge(CLK) then
                if RST = '1' then
                    STATE <= IDLE;
                    -- NEXT_STATE <= PLAYER1;
                else 
                    if (V = '1') then
                        case STATE is
                            when IDLE =>
                                STATE <= PLAYER1;
                            when PLAYER1 =>
                                STATE <= PLAYER2;
                            when PLAYER2 =>
                                STATE <= RESULT;
                            when RESULT =>
                                STATE <= IDLE;
                        end case; 
                        -- STATE <= NEXT_STATE;
                    end if;
                end if;
            end if;
        
        
    end process;

end Behavioral;
