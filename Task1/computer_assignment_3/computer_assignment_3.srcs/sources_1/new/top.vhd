library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( sw : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           dp : out STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0));
end top;

architecture Behavioral of top is

component Task3 is
    Port ( hex_in : in STD_LOGIC_VECTOR (3 downto 0);
           A : out STD_LOGIC;
           B : out STD_LOGIC;
           C : out STD_LOGIC;
           D : out STD_LOGIC;
           E : out STD_LOGIC;
           F : out STD_LOGIC;
           G : out STD_LOGIC);
end component;

component ssd_muxer is
Port (
	a_in       : in  std_logic_vector(3 downto 0);
	b_in       : in  std_logic_vector(3 downto 0);
	c_in       : in  std_logic_vector(3 downto 0);
	d_in       : in  std_logic_vector(3 downto 0);
	e_in       : in  std_logic_vector(3 downto 0);
	f_in       : in  std_logic_vector(3 downto 0);
	g_in       : in  std_logic_vector(3 downto 0);
	decp0_in   : in  std_logic;
	decp1_in   : in  std_logic;
	decp2_in   : in  std_logic;
	decp3_in   : in  std_logic;
	seg_out    : out std_logic_vector(6 downto 0);
	dp_out     : out std_logic;
	an_out     : out std_logic_vector(3 downto 0);
	clk        : in  STD_LOGIC
);
end component;

--signal w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14: std_logic;
--signal w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28: std_logic;
signal w1,w2,w3,w4,w5,w6,w7: std_logic_vector(3 downto 0);

begin

--enc1: task3 port map(hex_in => sw(15 downto 12),A=>w1,B=>w2,C=>w3,D=>w4,E=>w5,F=>w6,G=>w7);
--enc2: task3 port map(hex_in => sw(11 downto 8),A=>w8,B=>w9,C=>w10,D=>w11,E=>w12,F=>w13,G=>w14);
--enc3: task3 port map(hex_in => sw(7 downto 4),A=>w15,B=>w16,C=>w17,D=>w18,E=>w19,F=>w20,G=>w21);
--enc4: task3 port map(hex_in => sw(3 downto 0),A=>w22,B=>w23,C=>w24,D=>w25,E=>w26,F=>w27,G=>w28);
encoder1: task3 port map(hex_in => sw(15 downto 12),A=>w1(0),B=>w2(0),C=>w3(0),D=>w4(0),E=>w5(0),F=>w6(0),G=>w7(0));
encoder2: task3 port map(hex_in => sw(11 downto 8),A=>w1(1),B=>w2(1),C=>w3(1),D=>w4(1),E=>w5(1),F=>w6(1),G=>w7(1));
encoder3: task3 port map(hex_in => sw(7 downto 4),A=>w1(2),B=>w2(2),C=>w3(2),D=>w4(2),E=>w5(2),F=>w6(2),G=>w7(2));
encoder4: task3 port map(hex_in => sw(3 downto 0),A=>w1(3),B=>w2(3),C=>w3(3),D=>w4(3),E=>w5(3),F=>w6(3),G=>w7(3));
--mux: ssd_muxer port map(a_in(0) => w1,a_in(1)=>w8,a_in(2)=>w15,a_in(3)=>w22,
--b_in(0)=>w2,b_in(1)=>w9,b_in(2)=>w16,b_in(3)=>w23,c_in(0)=>w3,c_in(1)=>w10,c_in(2)=>w17,c_in(3)=>w24,
--d_in(0)=>w4,d_in(1)=>w11,d_in(2)=>w18,d_in(3)=>w25,e_in(0)=>w5,e_in(1)=>w12,e_in(2)=>w19,e_in(3)=>w26,
--f_in(0)=>w6,f_in(1)=>w13,f_in(2)=>w20,f_in(3)=>w27,g_in(0)=>w7,g_in(0)=>w7,g_in(1)=>w14,g_in(2)=>w21,
--g_in(3)=>w28,seg_out(6 downto 0) => seg(6 downto 0),decp0_in => '0',decp1_in => '0',decp2_in => '0',decp3_in => '0',clk => clk,an_out => an);

mux: ssd_muxer port map (a_in => w1, b_in => w2,c_in => w3,d_in => w4,e_in=>w5,f_in=>w6,g_in=>w7, seg_out=>seg,clk => clk,
decp0_in => '0',decp1_in => '0',decp2_in => '0',decp3_in => '0',an_out=>an); 


led <= sw;


end Behavioral;
