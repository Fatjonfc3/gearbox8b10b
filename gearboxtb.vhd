library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

entity tb is
end entity tb;

architecture rtl of tb is

constant DATA_IN_WIDTH : integer := 8;
constant DATA_OUT_WIDTH : integer := 10;

signal i_Clk , rst : std_logic := '0';
signal data_in : std_logic_vector ( DATA_IN_WIDTH - 1 downto 0) := (others => '0' );
signal data_out : std_logic_vector ( DATA_OUT_WIDTH  - 1 downto 0);
signal o_ce : std_logic;

constant clk_period : time := 100ns;

begin

clk_gen : process
begin
wait for clk_period/2;
i_clk <= not i_clk;
end process;

stimulus : process
begin
rst <= '1';
wait for  160ns;
rst <= '0';
wait until falling_edge ( i_clk );
data_in <= x"ff";
wait until falling_edge ( i_clk );
data_in <= x"00";
wait until falling_edge ( i_clk );
data_in <= x"ff";
wait until falling_edge ( i_clk );
data_in <= x"00";
wait until falling_edge ( i_clk );
data_in <= x"ff";
wait until falling_edge ( i_clk );
data_in <= x"00";
wait until falling_edge ( i_clk );
data_in <= x"ff";
wait until falling_edge ( i_clk );
data_in <= x"00";
wait for 1 ms;
wait;

end process;

dut : entity work.gearbox8b10b 
generic map (
DATA_IN_WIDTH => DATA_IN_WIDTH , DATA_OUT_WIDTH => DATA_OUT_WIDTH )
port map (
i_clk => i_clk , rst => rst,
data_in => data_in , data_out => data_out ,
o_ce => o_ce
);



end architecture rtl;

