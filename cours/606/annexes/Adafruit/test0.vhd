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
    signal s_clk_out : std_logic := '0';
	 signal cpt : std_logic_vector (31 downto 0);
begin

    clk_out <= s_clk_out;
	 -- Gestion de clk_out
    process (clk_in)
	    variable cpt2 : integer := 0;
	 begin
	    if (cpt2 < 3) then
	       s_clk_out <= '0';
	    elsif(cpt2 < 4) then
	       s_clk_out <= '1';
	    else
	       cpt2 := 0;
	    end if;
	    cpt2 := cpt2 + 1;
	 end process;

    process (s_clk_out)
	    variable cpt : std_logic_vector (31 downto 0) := (others => '0');
	 begin
	    if (s_clk_out='0') then
	       if (unsigned(cpt) < 32) then
		        if (cpt(0) = '1') then
			        rgb1(2) <= '1'; 
			     else
			        rgb1(2) <= '0';
			     end if;
              if (cpt(2) = '1') then
			        rgb1(1) <= '1'; 
			     else
			        rgb1(1) <= '0';
			     end if;
			     if (cpt(4) = '1') then
			        rgb1(0) <= '1'; 
			     else
			        rgb1(0) <= '0';
			     end if;
			     cpt := std_logic_vector( unsigned(cpt) + 1 );
				  lat <= '0';
	       else		      
		        lat <= '1';
			     lat <= '0';
				  -- reinitialisation
              cpt := (others => '0');				  
		    end if;		 
	    end if;
	 end process;
	 
	 process (clk_in)
	    variable cpt1 : integer := 0;
	 begin
	     if (cpt1 < 50000000) then
	        oe <= '0';
		  elsif (cpt1 < 100000000) then
		     oe <= '1';
		  else 
		     cpt1 := 0;
		  end if;
		  cpt1 := cpt1 + 1;
	 end process;

end Behavioral;
