
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
signal s_rgb1 : std_logic_vector (2 downto 0) := (others => '0');
signal s_lat : std_logic := '0';
signal s_oe : std_logic := '1';
signal s_rst : std_logic := '1';
signal clk_div2 : std_logic := '0';
signal clk_div4 : std_logic := '0';
signal trigger : integer := '0';     -- pour déclencher la fin du chargement


-- Essential state machine signals
    type STATE_TYPE is (INIT, READ_PIXEL_DATA, INCR_RAM_ADDR, LATCH, INCR_LED_ADDR);
    signal state, next_state : STATE_TYPE;

begin
-- assignation
	rgb1 <= s_rgb1;
	lat <= s_lat;
	oe <= s_oe;
	rst <= s_rst;

process (clk_in, rst)
    if (rst = ‘1’) then
	state <= INIT;
	s_rgb1 <= (others => '0');
 	s_lat : std_logic := '0';
	s_oe : std_logic := '1';
	s_rst : std_logic := '1';
	clk_div2 : std_logic := '0';
	clk_div4 : std_logic := '0';

	elsif(rising_edge(clk_in)) then
	state <= next_state;
	end if;
	end process; 


	-- Next-state logic
    process(state,s_rgb1, data) is

	
	begin

	
        -- States
        case state is
            when INIT =>
	 -- Default signal assignments
        s_clk_out <= '0';
        s_lat <= '0';
        s_oe <= '1'; -- this signal is "active low"
        s_rgb1 <= (others => '0');

	 next_state <= READ_PIXEL_DATA;
	
	when READ_PIXEL_DATA =>
                s_oe <= '0'; -- enable display
                
		-- chargement du regitre

	if (unsigned(cpt1) < 32) then

		—- allune 1 LED rouge sur 2
		if (cpt1(0) = '1') then
		s_rgb1(2) <= '1';
		else
		s_rgb1(2) <= '0';
		end if;


		—- allune 1 LED verte sur 4
		if (cpt1(1) = '1') then
		s_rgb1(1) <= '1';
		else
		s_rgb1(1) <= '0';
		end if;

		—- allune 1 LED bleue sur 8
		if (cpt1(2) = '1') then
		s_rgb1(0) <= '1';
		else
		s_rgb1(0) <= '0';
		end if;

		trigger <= '0';


	
		next_state <= INCR_RAM_ADDR;

		else
                    next_state <= INCR_LED_ADDR;
                end if;

		when INCR_RAM_ADDR =>
                s_clk_out <= '1'; -- pulse the output clock
                s_oe <= '0'; -- enable display

		 cpt1 := std_logic_vector(unsigned(cpt1)+1);

                next_ram_addr <= std_logic_vector( unsigned(s_ram_addr) + 1 );
                next_state <= READ_PIXEL_DATA;
            when INCR_LED_ADDR =>
                -- display is disabled during led_addr (select lines) update
                next_led_addr <= std_logic_vector( unsigned(s_led_addr) + 1 );
                next_col_count <= (others => '0'); -- reset the column counter
                next_state <= LATCH;
            when LATCH =>
                -- display is disabled during latching
                s_lat <= '1'; -- latch the data
                next_state <= INIT; -- restart state machine
            when others => null;
        end case;

	end process; 





begin
process (clk_in)
	variable cpt : integer := 0;
	variable cpt1 : std_logic_vector (31 downto 0) := (others => '0');
begin

	-- assignation
	rgb1 <= s_rgb1;
	lat <= s_lat;
	oe <= s_oe;

	-- chargement du regitre

	if (unsigned(cpt1) < 32) then

		—- allune 1 LED rouge sur 2
		if (cpt1(0) = '1') then
		s_rgb1(2) <= '1';
		else
		s_rgb1(2) <= '0';
		end if;


		—- allune 1 LED verte sur 4
		if (cpt1(1) = '1') then
		s_rgb1(1) <= '1';
		else
		s_rgb1(1) <= '0';
		end if;

		—- allune 1 LED bleue sur 8
		if (cpt1(2) = '1') then
		s_rgb1(0) <= '1';
		else
		s_rgb1(0) <= '0';
		end if;

	trigger <= '0';

	else

	-- lat une seule fois par cycle
	if (unsigned(cpt1) < 32) then
	s_lat <= '1';
	elsif (unsigned(cpt1) > 33) then
	s_lat <= '0';

	-- Oe pour activer l'affichage

	if (cpt < 10) then
	s_oe <= '0';
	elsif (cpt < 500) then
	s_oe <= '1';
	else
	cpt := 0;
	cpt1  := (others => '0');
	end if;
	cpt := cpt + 1;
	end if;
	-- trigger
	if (unsigned(cpt1) > 32) then
	trigger <= '1';
	end if;
	cpt1 := std_logic_vector(unsigned(cpt1)+1);
	end process;

	-- gestion du clk_out

	process(clk_in)
	begin
	if(trigger =0) then
	clk_out <= clk_div2;
	else clk_out <= '0';
	end if;

	end process;

	-- diviseur de frequence

process(clk_in)
variable cpt3 : integer := 0;

begin

if(cpt3 mod 2 = 0) then
clk_div2 <= not clk_div2;
end if;

if(cpt3 mod 4 = 0) then
clk_div4 <= not clk_div4;
end if;

cpt3 := cpt3 +1 ;

end process;


end Behavioral;