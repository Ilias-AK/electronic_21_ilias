

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity NAOA2 is
    Port ( A : in STD_LOGIC;B : in STD_LOGIC;C : in STD_LOGIC;D : in STD_LOGIC;Y : out STD_LOGIC);
end NAOA2;

architecture Behavioral of NAOA2 is
    -- Component declarations
    component NA2
        Port (A, B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    component or_gate -- or O2
        Port (A, B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    component and_gate -- or A2
        Port (A, B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    -- Internal signals
    signal s_nand : STD_LOGIC;
    signal s_or   : STD_LOGIC;

begin
    -- 1. NAND gate: (A NAND B)
    G1: NA2 port map (A => A, B => B, Y => s_nand);

    -- 2. OR gate: (s_nand OR C)
    G2: or_gate port map (A => s_nand, B => C, Y => s_or);

    -- 3. AND gate: (s_or AND D)
    G3: and_gate port map (A => s_or, B => D, Y => Y);

end Behavioral;
