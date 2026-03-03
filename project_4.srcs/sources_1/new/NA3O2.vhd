
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NA3O2 is
    Port ( A : in STD_LOGIC;B : in STD_LOGIC;C : in STD_LOGIC;D : in STD_LOGIC;Y : out STD_LOGIC);
end NA3O2;

architecture Behavioral of NA3O2 is
    component NA3
        Port (A, B, C : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    component or_gate
        Port (A, B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    signal internal_nand : STD_LOGIC;

begin
    -- 1. 3-input NAND of A, B, and C
    G1: NA3 port map (A => A, B => B, C => C, Y => internal_nand);

    -- 2. OR the result with input D
    G2: or_gate port map (A => internal_nand, B => D, Y => Y);

end Behavioral;
