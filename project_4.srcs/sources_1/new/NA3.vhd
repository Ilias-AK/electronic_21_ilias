library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NA3 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           Y : out STD_LOGIC);
end NA3;

architecture Behavioral of NA3 is
    component and_gate
        Port (A : in STD_LOGIC; B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    component not_gate
        Port (A : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    signal and_ab   : STD_LOGIC; -- Result of A and B
    signal and_abc  : STD_LOGIC; -- Result of (A and B) and C

begin
    U1: and_gate port map (A => A, B => B, Y => and_ab);
    U2: and_gate port map (A => and_ab, B => C, Y => and_abc);
    U3: not_gate port map (A => and_abc, Y => Y);

end Behavioral;