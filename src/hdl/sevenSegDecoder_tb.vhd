--+----------------------------------------------------------------------------
--| 
--| COPYRIGHT 2017 United States Air Force Academy All rights reserved.
--| 
--| United States Air Force Academy     __  _______ ___    _________ 
--| Dept of Electrical &               / / / / ___//   |  / ____/   |
--| Computer Engineering              / / / /\__ \/ /| | / /_  / /| |
--| 2354 Fairchild Drive Ste 2F6     / /_/ /___/ / ___ |/ __/ / ___ |
--| USAF Academy, CO 80840           \____//____/_/  |_/_/   /_/  |_|
--| 
--| ---------------------------------------------------------------------------
--|
--| FILENAME      : sevenSegDecoder_tb.vhd
--| AUTHOR(S)     : Capt Warner
--| CREATED       : 01/17/2017
--| DESCRIPTION   : This file implements a seven segment decoder test bench.
--|
--| DOCUMENTATION : Modified slightly by Capt Johnson
--|
--+----------------------------------------------------------------------------
--|
--| REQUIRED FILES :
--|
--|    Libraries : ieee
--|    Packages  : std_logic_1164, numeric_std, unisim
--|    Files     : sevenSegDecoder.vhd
--|
--+----------------------------------------------------------------------------
--|
--| NAMING CONVENSIONS :
--|
--|    xb_<port name>           = off-chip bidirectional port ( _pads file )
--|    xi_<port name>           = off-chip input port         ( _pads file )
--|    xo_<port name>           = off-chip output port        ( _pads file )
--|    b_<port name>            = on-chip bidirectional port
--|    i_<port name>            = on-chip input port
--|    o_<port name>            = on-chip output port
--|    c_<signal name>          = combinatorial signal
--|    f_<signal name>          = synchronous signal
--|    ff_<signal name>         = pipeline stage (ff_, fff_, etc.)
--|    <signal name>_n          = active low signal
--|    w_<signal name>          = top level wiring signal
--|    g_<generic name>         = generic
--|    k_<constant name>        = constant
--|    v_<variable name>        = variable
--|    sm_<state machine type>  = state machine type definition
--|    s_<signal name>          = state name
--|
--+----------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  
entity sevenSegDecoder_tb is
end sevenSegDecoder_tb;

architecture test_bench of sevenSegDecoder_tb is 

	-- Component Declaration	
  component sevenSegDecoder is
	Port ( i_D : in STD_LOGIC_VECTOR (3 downto 0);
           o_S : out STD_LOGIC_VECTOR (6 downto 0));
             
  end component;
  
  signal sw : std_logic_vector(3 downto 0);
  signal w_seg : std_logic_vector(6 downto 0);

    
begin
	-- PORT MAPS ----------------------------------------
	sevenSegDecoder_inst : sevenSegDecoder port map (
	   i_D(0) => sw(0),
	   i_D(1) => sw(1),
	   i_D(2) => sw(2),
	   i_D(3) => sw(3),
	   o_S(0) => w_seg(0),
	   o_S(1) => w_seg(1),
	   o_S(2) => w_seg(2),
	   o_S(3) => w_seg(3),
	   o_S(4) => w_seg(4),
	   o_S(5) => w_seg(5),
	   o_S(6) => w_seg(6)
	);
	-----------------------------------------------------
	
	-- PROCESSES ----------------------------------------	
	-- Test plan process
	-- Testing each combination 
	test_process : process 
	begin
	   
	sw <= x"0"; wait for 10 ns;
       assert w_seg = x"40" report "bad sum" severity failure;
    sw <= x"1"; wait for 10 ns;
        assert w_seg = x"79" report "bad sum" severity failure; 
    sw <= x"2"; wait for 10 ns;
        assert w_seg = x"24" report "bad sum" severity failure;
    sw <= x"3"; wait for 10 ns;
        assert w_seg = x"30" report "bad sum" severity failure; 
    sw <= x"4"; wait for 10 ns;
        assert w_seg = x"19" report "bad sum" severity failure;
    sw <= x"5"; wait for 10 ns;
        assert w_seg = x"12" report "bad sum" severity failure;
    sw <= x"6"; wait for 10 ns;
        assert w_seg = x"2" report "bad sum" severity failure;
    sw <= x"7"; wait for 10 ns;
        assert w_seg = x"78" report "bad sum" severity failure;
    sw <= x"8"; wait for 10 ns;
        assert w_seg = x"0" report "bad sum" severity failure;
    sw <= x"9"; wait for 10 ns;
        assert w_seg = x"18" report "bad sum" severity failure;
    sw <= x"A"; wait for 10 ns;
        assert w_seg = x"8" report "bad sum" severity failure;
    sw <= x"B"; wait for 10 ns;
        assert w_seg = x"3" report "bad sum" severity failure;
    sw <= x"C"; wait for 10 ns;
        assert w_seg = x"27" report "bad sum" severity failure;
    sw <= x"D"; wait for 10 ns;
        assert w_seg = x"21" report "bad sum" severity failure;
    sw <= x"E"; wait for 10 ns;
        assert w_seg = x"6" report "bad sum" severity failure;
    sw <= x"F"; wait for 10 ns;
        assert w_seg = x"E" report "bad sum" severity failure; 
	
		
		wait; -- wait forever
		
	end process;	
	-----------------------------------------------------	
	
end test_bench;
