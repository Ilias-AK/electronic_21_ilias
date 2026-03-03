library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity A3 is
    Port ( A : in STD_LOGIC;B : in STD_LOGIC;C : in STD_LOGIC;Y : out STD_LOGIC);
end A3;

architecture Behavioral of A3 is
    -- Declare the 2-input AND gate component
    component and_gate
        Port (A : in STD_LOGIC; B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    -- Internal signal to hold the intermediate result (A AND B)
    signal and_intermediate : STD_LOGIC;

begin
    -- First Gate: Computes (A AND B)
    GATE1: and_gate port map (
        A => A, 
        B => B, 
        Y => and_intermediate
    );

    -- Second Gate: Computes (A AND B) AND C
    GATE2: and_gate port map (
        A => and_intermediate, 
        B => C, 
        Y => Y
    );

end Behavioral;
