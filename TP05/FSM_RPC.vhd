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
    Port ( CLK : in STD_LOGIC; -- Déclaration des ports d'entrée et de sortie
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

    -- Déclaration des énumération (des nouveaux types de variable)
    type GAME_STATE is (IDLE, PLAYER1, PLAYER2, RESULT); -- Un type pour chaque état de notre machine à état
    type GAME_SIGN IS (ROCK, PAPER, SCISSORS); -- Un type pour chaque signe du jeu roche-papier-ciseaux

    signal STATE : GAME_STATE; -- Un premier signal pour garder en mémoire l'état actuel
    signal SIGN1, SIGN2, PLAYED_SIGN : GAME_SIGN; -- Un deuxième pour garder en mémoire le signe qui vient d'être sélectionné par le joueur
    -- Puis deux signaux pour garder en mémoire le signe choisi par le joueur en appuyant sur V
    signal SIGN_DISPLAY_VECTOR : STD_LOGIC_VECTOR (4 downto 0); -- Un signal qui conserve en mémoire le nombre binaire 5 bits correspondant à la lettre qu'il faut afficher
 

begin

    process(CLK, RST) -- Un processus qui gère la transition entre les états ainsi que le bouton reset RST
    begin
            if rising_edge(CLK) then -- Tout est synchrone
                if RST = '1' then -- Si RST est actif on fait rien d'autre on revient direct sur IDLE (l'état inactif)...
                    STATE <= IDLE; -- ... vu que l'horloge est très rapide, il est impossible de briser la machine en appuyant à la fois sur RST et R par exemple
                else 
                    if (V = '1') then
                        case STATE is -- À chaque état, si on appuie sur V, on passe au suivant et on enregistre le signe joué pour les états concernés
                            when IDLE =>
                                STATE <= PLAYER1;
                            when PLAYER1 =>
                                STATE <= PLAYER2;
                                SIGN1 <= PLAYED_SIGN;
                            when PLAYER2 =>
                                STATE <= RESULT;
                                SIGN2 <= PLAYED_SIGN;
                            when RESULT =>
                                STATE <= IDLE;
                        end case; 
                    end if;
                end if;
            end if;
    end process;

    process(R, P, C) -- Processus qui gère la sélection d'un signe par le joueur
    begin
        if rising_edge(CLK) then -- Au front montant de l'horloge, pour chaque bouton, on assigne PLAYED_SIGN au signe sélectionné et son nombre d'affiche à SIGN_DISPLAY_VECTOR
            if R = '1' then
                PLAYED_SIGN <= ROCK;
                SIGN_DISPLAY_VECTOR <= "10000";
            elsif P = '1' then
                PLAYED_SIGN <= PAPER;
                SIGN_DISPLAY_VECTOR <= "10001";
            elsif C = '1' then
                PLAYED_SIGN <= SCISSORS;
                SIGN_DISPLAY_VECTOR <= "10010";
            else
            end if;
        end if;
    end process;
    
    process(STATE) -- Processus qui gère ce qui est affiché pour chaque état
    begin
        case STATE is
            when IDLE => -- [---- ----]
                Disp0 <= "11110";
                Disp1 <= "11110";
                Disp2 <= "11110";
                Disp3 <= "11110";
                
                Disp4 <= "11110";
                Disp5 <= "11110";
                Disp6 <= "11110";
                Disp7 <= "11110";
            
            when PLAYER1 => -- [P1__ PPPP] par exemple
                Disp0 <= SIGN_DISPLAY_VECTOR;
                Disp1 <= SIGN_DISPLAY_VECTOR;
                Disp2 <= SIGN_DISPLAY_VECTOR;
                Disp3 <= SIGN_DISPLAY_VECTOR;
                
                Disp4 <= "11111";
                Disp5 <= "11111";
                Disp6 <= "00001";
                Disp7 <= "10001";
            when PLAYER2 => -- [P2__ PPPP] par exemple
                Disp0 <= SIGN_DISPLAY_VECTOR;
                Disp1 <= SIGN_DISPLAY_VECTOR;
                Disp2 <= SIGN_DISPLAY_VECTOR;
                Disp3 <= SIGN_DISPLAY_VECTOR;
                
                Disp4 <= "11111";
                Disp5 <= "11111";
                Disp6 <= "00010";
                Disp7 <= "10001";
            
            when RESULT => -- d'abord initialisé à [_-__ ____]
                Disp0 <= "11111";
                Disp1 <= "11111";
                Disp2 <= "11111";
                Disp3 <= "11111";
                
                Disp4 <= "11111";
                Disp5 <= "11111";
                Disp6 <= "11110";
                Disp7 <= "11111";
                
                if SIGN1 = SIGN2 then -- Si les deux signes sont égaux, c'est une égalité [_E__ ____]
                    Disp6 <= "01110";
                elsif (SIGN1 = ROCK and SIGN2 = SCISSORS) or (SIGN1 = PAPER and SIGN2 = ROCK) then
                    -- Si 1: roche, 2: ciseaux ou 1: papier, 2: roche, le joueur 1 gagne [_1__ ____]
                    Disp6 <= "00001";
                else -- Dans tous les autres cas, le joueur 2 l'emporte [_2__ ____]
                    Disp6 <= "00010";
                end if;
            
        end case;
    end process;



end Behavioral;
