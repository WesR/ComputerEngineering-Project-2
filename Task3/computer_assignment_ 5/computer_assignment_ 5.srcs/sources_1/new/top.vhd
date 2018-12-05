--Wes

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity top is
    Port ( switch : in STD_LOGIC_VECTOR (7 downto 0);--0 and 1 are broken
           clk : in STD_LOGIC;
           btnR : in std_logic;
           btnL : in std_logic;
           led : out STD_LOGIC_VECTOR (15 downto 0));
end top;

architecture Behavioral of top is

-- Import Components
component debounce is
    Port ( CLK_100M  : in std_logic;
       SW       : in std_logic;
       sglPulse : out std_logic;
       Sig      : out std_logic);
end component;

signal btnR_deb, btnL_deb: std_logic;

begin
debounce1: debounce port map(CLK_100M => clk, SW => btnL, sglPulse => btnL_deb, Sig => open);
debounce2: debounce port map(CLK_100M => clk, SW => btnR, sglPulse => btnR_deb, Sig => open);

process (clk)
    variable saved : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    
    begin
    if btnL_deb = '1' then
        if (to_integer(unsigned(switch)) = to_integer(unsigned(saved))) then
            led <= "1000000000000000";
        else
            led <= "0000000000000000";
        end if;
    end if;
    if btnR_deb = '1' then
        saved := switch;
        led <= "0000000000000000";
    end if;
end process;

--led <= switch;
--led <= "1000000000000000";

end Behavioral;
