library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity NEX2 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;    
           Y : out STD_LOGIC);
end NEX2;

architecture Behavioral of NEX2 is
    -- Declare the XOR component
    component xor_gate
        Port (A, B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    -- Declare the NOT component
    component not_gate
        Port (A : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    -- Internal signal to connect the XOR output to the NOT input
    signal s_xor : STD_LOGIC;

begin
    -- 1. Compute the Exclusive-OR of A and B
    G1: xor_gate port map (
        A => A, 
        B => B, 
        Y => s_xor
    );

    -- 2. Invert the result to get Exclusive-NOR
    G2: not_gate port map (
        A => s_xor, 
        Y => Y
    );

end Behavioral;
