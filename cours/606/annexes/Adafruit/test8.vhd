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
	signal s_rgb1 : std_logic_vector(2 downto 0) := (others => '0');
	signal s_lat : std_logic := '0';
   signal s_oe : std_logic := '1';
	signal clk_div2 : std_logic := '0';
	signal clk_div4 : std_logic := '0';
	signal trigger : integer := 0;
begin
   process (clk_div4)
	   variable cpt : integer := 0;
		variable cpt1 : std_logic_vector (31 downto 0) := (others => '0');
	begin
	    -- asssignation
	    rgb1 <= s_rgb1;
		 lat <= s_lat;
		 oe <= s_oe;
	    -- chargement registre
	    if (unsigned(cpt1) < 32) then
		    if (cpt1(0) = '1') then
		       s_rgb1(2) <= '1'; 
		    else
	          s_rgb1(2) <= '0';
    	    end if;
			 s_oe <= '0';
			 s_lat <= '0';
			 trigger <= 0;
		 else
		    -- oe
		    if (unsigned(cpt1) = 32) then
             s_oe <= '1';
			 elsif (unsigned(cpt1) >= 35) then
			    s_oe <= '0';
			 end if;
		    -- lat s'execute une seule fois par cycle et lorsque le registre est plein
	       if (unsigned(cpt1) = 33) then
             s_lat <= '1';
			 elsif (unsigned(cpt1) >= 34) then
			    s_lat <= '0';
			 end if;
			 if (cpt > 500) then
			     cpt := 0;
				  cpt1 := (others => '0');
		    end if;
		    cpt := cpt + 1;
          -- trigger
          if (unsigned(cpt1) > 32) and (unsigned(cpt1) < 36) then
              trigger <= 1;
			 else
			     trigger <= 0;
          end if;			 
		 end if;
		 cpt1 := std_logic_vector( unsigned(cpt1) + 1 );  
	end process;
	
	-- gestion clk_out
	process (clk_in)
	begin
	    if (trigger = 0) then
		   clk_out <= clk_div2;
       else
         clk_out <= '0';	 
	  end if;	 
	end process;
	
	-- Diviseur de frequence
	process (clk_in)
       variable cpt3 : integer := 0;	
	begin
	    if (cpt3 mod 2 = 0) then 
		     clk_div2 <= not clk_div2;
		 end if;
		 if (cpt3 mod 4 = 0) then 
		     clk_div4 <= not clk_div4;
		 end if;
		 cpt3 := cpt3 + 1;
	end process;
end Behavioral;

