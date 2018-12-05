----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2018 09:50:40 PM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


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
    Port ( sw : in STD_LOGIC_VECTOR (7 downto 0);
           btnR : in STD_LOGIC;
           btnL : in STD_LOGIC;
           clk : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           dp : out STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is


component encoder is
    Port ( hex_in : in STD_LOGIC_VECTOR (3 downto 0);
           A : out STD_LOGIC;
           B : out STD_LOGIC;
           C : out STD_LOGIC;
           D : out STD_LOGIC;
           E : out STD_LOGIC;
           F : out STD_LOGIC;
           G : out STD_LOGIC);
end component;

component debounce is
    Port ( CLK_100M  : in std_logic;
           SW       : in std_logic;
           sglPulse : out std_logic;
           Sig      : out std_logic);
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
	clk        : in  STD_LOGIC);
end component;

signal en, clr: std_logic;
signal accumulator: std_logic_vector(7 downto 0);
signal number, num1, num2, num3, num4: integer;
signal hex1, hex2, hex3, hex4: std_logic_vector(3 downto 0);
signal w1,w2,w3,w4,w5,w6,w7: std_logic_vector(3 downto 0);

begin

encoder1: encoder port map(hex_in => hex1,A=>w1(0),B=>w2(0),C=>w3(0),D=>w4(0),E=>w5(0),F=>w6(0),G=>w7(0));
encoder2: encoder port map(hex_in => hex2,A=>w1(1),B=>w2(1),C=>w3(1),D=>w4(1),E=>w5(1),F=>w6(1),G=>w7(1));
encoder3: encoder port map(hex_in => hex3,A=>w1(2),B=>w2(2),C=>w3(2),D=>w4(2),E=>w5(2),F=>w6(2),G=>w7(2));
encoder4: encoder port map(hex_in => hex4,A=>w1(3),B=>w2(3),C=>w3(3),D=>w4(3),E=>w5(3),F=>w6(3),G=>w7(3));

d1: debounce port map(CLK_100M => clk, SW => btnL, sglPulse => clr, Sig => open);
d2: debounce port map(CLK_100M => clk, SW => btnR, sglPulse => en, Sig => open);

mux: ssd_muxer port map (a_in => w1, b_in => w2,c_in => w3,d_in => w4,e_in=>w5,f_in=>w6,g_in=>w7, seg_out=>seg,clk => clk,
decp0_in => '0',decp1_in => '0',decp2_in => '0',decp3_in => '0',an_out=>an); 

led <= sw;

process(en, clr)
begin
if rising_edge(clk) then

if(en = '1') then
    accumulator <= sw;
elsif (en = '0') then
      accumulator(0) <= '0';
      accumulator(1) <= '0';
      accumulator(2) <= '0';
      accumulator(3) <= '0';
      accumulator(4) <= '0';
      accumulator(5) <= '0';
      accumulator(6) <= '0';
      accumulator(7) <= '0';
end if;

end if;

end process;

process(accumulator)
begin

if rising_edge(clk) then
  
    number <= to_integer(signed(accumulator));
    number <= abs(number);
    
    num1 <= number mod 10;
    number <= number / 10;
    num2 <= number mod 10;
    number <= number / 10;
    num3 <= number mod 10;
    
    if(accumulator(7) = '1') then
        num4 <= 11;
    else
        num4 <= 10;
    end if;
    
    hex1 <= std_logic_vector(to_unsigned(num1, hex1'length));
    hex2 <= std_logic_vector(to_unsigned(num2, hex2'length));
    hex3 <= std_logic_vector(to_unsigned(num3, hex3'length));
    hex4 <= std_logic_vector(to_unsigned(num4, hex4'length));

end if;

end process;


end Behavioral;

