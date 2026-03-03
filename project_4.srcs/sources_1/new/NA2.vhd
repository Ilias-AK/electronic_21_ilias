
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NA2 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Y : out STD_LOGIC);
end NA2;

architecture Behavioral of NA2 is
    -- Component declarations (as you already have)
    component and_gate
        Port (A : in STD_LOGIC; B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    component not_gate
        Port (A : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    -- We need a "wire" to connect the output of AND to the input of NOT
    signal internal_and : STD_LOGIC;

begin

    -- 1. Instantiate the AND gate
    AND_INST: and_gate port map (
        A => A,
        B => B,
        Y => internal_and
    );

    -- 2. Instantiate the NOT gate
    NOT_INST: not_gate port map (
        A => internal_and,
        Y => Y
    );

end Behavioral;