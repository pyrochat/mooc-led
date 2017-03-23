library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity test0 is
	 port (
        clk_in   : in  std_logic;
		  rst   : in  std_logic;
        -- LED Panel IO
        clk_out  : out std_logic;
        rgb1     : out std_logic_vector(2 downto 0);
        rgb2     : out std_logic_vector(2 downto 0);
        led_addr : out std_logic_vector(2 downto 0);
        lat      : out std_logic;
        oe       : out std_logic
    );
end test0;

architecture Behavioral of test0 is

begin
   process (clk_in)
	    variable cpt : integer := 0;
	begin
		     if (cpt < 1000000000) then
			      oe <= '0';
			  elsif (cpt < 50000000000) then
			      oe <= '1';
			  else
			      cpt := 0;
			  end if;
			  cpt := cpt + 1;  
	end process;
end Behavioral;