library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity var4 is
    Port ( 
        X1 : in  STD_LOGIC;
        X2 : in  STD_LOGIC;
        X3 : in  STD_LOGIC;
        X4 : in  STD_LOGIC;
        Y1 : out STD_LOGIC;
        Y2 : out STD_LOGIC; -- Обратите внимание: на схеме порядок Y1, Y3, Y4, Y2
        Y3 : out STD_LOGIC;
        Y4 : out STD_LOGIC
    );
end var4;

architecture Structural of var4 is
    component not_gate 
        Port (A : in STD_LOGIC; Y : out STD_LOGIC);
    end component;
    component NEX2
        Port (A : in STD_LOGIC; B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;
    component and_gate
        Port (A : in STD_LOGIC; B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;
    component NA3
        Port (A : in STD_LOGIC; B : in STD_LOGIC; C : in STD_LOGIC; Y : out STD_LOGIC);
    end component;
    component NA2 
        Port ( A : in STD_LOGIC;B : in STD_LOGIC;Y : out STD_LOGIC);
    end component;
    component NAOA2
            Port ( A : in STD_LOGIC;B : in STD_LOGIC;C : in STD_LOGIC;D : in STD_LOGIC;Y : out STD_LOGIC);
    end component;
    component NA3O2
        Port ( A : in STD_LOGIC;B : in STD_LOGIC;C : in STD_LOGIC;D : in STD_LOGIC;Y : out STD_LOGIC);
    end component;
    component A3
        Port ( A : in STD_LOGIC;B : in STD_LOGIC;C : in STD_LOGIC;Y : out STD_LOGIC);
    end component;
    component NAO3
        Port ( A : in STD_LOGIC;B : in STD_LOGIC;C : in STD_LOGIC;D : in STD_LOGIC;Y : out STD_LOGIC);
    end component;
    signal wire_fcr1_nex2 : STD_LOGIC;
    signal wire_scr1_not : STD_LOGIC;
    
    signal wire_tcr1_not : STD_LOGIC;
    signal wire_tcr2_not : STD_LOGIC;
    
    signal wire_not_x1_out : STD_LOGIC;
    signal wire_not_mid_nao3 : STD_LOGIC;
    signal wire_nex2_out : STD_LOGIC;
    signal wire_nao3_out : STD_LOGIC;
    signal wire_not_tcr3 : STD_LOGIC;
    signal wire_and_fcr4 : STD_LOGIC;
    signal wire_not_focr5 : STD_LOGIC;
    
    signal wire_ficr1_out : STD_LOGIC;
    signal wire_ficr2_out : STD_LOGIC;
    signal wire_ficr3_out : STD_LOGIC;
    signal wire_ficr4_out : STD_LOGIC;
    signal wire_ficr5_out : STD_LOGIC;
    signal wire_ficr6_out : STD_LOGIC;
    signal wire_ficr7_out : STD_LOGIC;
    
    signal wire_scxr1_na3o2 : STD_LOGIC;
    signal wire_scxr2_a3 : STD_LOGIC;
    signal wire_scxr3_nao3 : STD_LOGIC;
    signal wire_sxcr4_nao3 : STD_LOGIC;
begin
    FCR1 : NEX2 port map (A => x3, B => x4, Y => wire_fcr1_nex2);
    
    SCR1 : not_gate port map (A => wire_fcr1_nex2,Y => wire_scr1_not); 
    
    TCR1 : not_gate port map (A => wire_scxr3_nao3, Y => wire_tcr1_not);
    TCR2 : not_gate port map (A => wire_scr1_not, Y => wire_tcr2_not);
    
    FOCR1 : not_gate port map (A => x1, Y => wire_not_x1_out);
    FOCR2 : NEX2 port map (A => x1 , B => wire_tcr1_not, Y => wire_nex2_out);
    FOCR3 : not_gate port map (A => wire_sxcr4_nao3, Y => wire_not_tcr3);
    FOCR4 : and_gate port map (A => wire_tcr1_not, B => wire_tcr2_not , Y => wire_and_fcr4);
    FOCR5 : not_gate port map (A => x3, Y => wire_not_focr5);
    
    FICR1 : NA3 port map (A => wire_not_tcr3, B => x4, C => wire_not_x1_out, Y => wire_ficr1_out);
    FICR2 : not_gate port map (A => wire_scr1_not, Y => wire_ficr2_out);
    FICR3 : NA2 port map (A => wire_not_focr5, B => wire_nex2_out, Y => wire_ficr3_out);
    FICR4 : not_gate port map (A => wire_tcr1_not, Y => wire_ficr4_out);
    FICR5 : NA2 port map (A => wire_not_focr5, B => x2, Y => wire_ficr5_out);
    FICR6 : not_gate port map (A =>wire_scr1_not , Y =>wire_ficr6_out);
    FICR7 : NAOA2 port map (A => wire_and_fcr4, B => x2, C => wire_not_focr5, D => x1, Y => wire_ficr7_out);
    
    SXCR1 : NA3O2 port map (A => wire_ficr1_out, B => wire_ficr3_out, C => wire_not_x1_out, D => wire_ficr2_out, Y => wire_scxr1_na3o2);
    y1 <= wire_scxr1_na3o2;
    SXCR2 : A3 port map (A => wire_ficr4_out, B => x4, C => x1, Y => wire_scxr2_a3);
    y3 <= wire_scxr2_a3;
    SXCR3 : NAO3 port map (A => wire_ficr5_out, B => x2 ,C => wire_not_focr5, D => x4, Y => wire_scxr3_nao3);
    y4 <= wire_scxr3_nao3;
    SXCR4 : NAO3 port map (A => wire_ficr7_out, B => wire_ficr6_out, C => x1, D => x2, Y => wire_sxcr4_nao3);
    y2 <= wire_sxcr4_nao3;
end Structural;