library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAO3 is
    Port ( A : in STD_LOGIC;B : in STD_LOGIC;C : in STD_LOGIC;D : in STD_LOGIC;Y : out STD_LOGIC);
end NAO3;

architecture Behavioral of NAO3 is
    -- Using the 2-input NAND you built first
    component NA2
        Port (A, B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    -- Using a 3-input OR gate
    component O3
        Port (A, B, C : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    signal internal_nand : STD_LOGIC;

begin
    -- 1. NAND the first two inputs
    G1: NA2 port map (A => A, B => B, Y => internal_nand);

    -- 2. OR the result with C and D
    G2: O3 port map (A => internal_nand, B => C, C => D, Y => Y);

end Behavioral;
