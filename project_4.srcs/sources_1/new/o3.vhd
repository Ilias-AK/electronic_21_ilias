library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity o3 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           Y : out STD_LOGIC);
end o3;

architecture Behavioral of o3 is
begin
    Y <= A or B or C;
end Behavioral;