library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_td is
--  Port ( );
end top_td;

architecture Behavioral of top_td is

component top is
    Port ( sw : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           dp : out STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0));
end component;


signal sw,led: std_logic_vector(15 downto 0);
signal clk,dp: std_logic;
signal seg: std_logic_vector(6 downto 0);
signal an: std_logic_vector(3 downto 0);

begin

simulation: top port map (sw => sw, clk => clk, seg => seg, dp => dp, an => an, led => led);




end Behavioral;
