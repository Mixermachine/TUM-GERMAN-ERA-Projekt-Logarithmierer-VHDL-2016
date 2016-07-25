-- Testbench for the logarithmierer

-- importing the libs
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- defining the entity
entity logarithmiererTB is
end logarithmiererTB;

-- defining the architecture
architecture bhvlogarithmiererTB of logarithmiererTB is
	-- defining the testSignals
	signal LEFT_IN, RIGHT_IN : signed(17 downto 0);
	signal FLAG, SCLK: std_logic;

begin
	uut: entity work.logarithmierer port map (LEFT_IN, RIGHT_IN, FLAG, SCLK);
	
	process
	begin
	
	-- setting the standard values
	SCLK <= '1';
	FLAG <= '0';
	
	LEFT_IN <= to_signed(0,18);
	RIGHT_IN <= to_signed(0,18);
	
	wait for 100 ns;
	
	-- now begin with the loop test from -131072 to 131071
	
	for I in -131072 to 131071 loop
		-- setting the current I to left and right
		LEFT_IN <= to_signed(I,18);
		RIGHT_IN <= to_signed(I,18);
		
		-- notifing the logarithmierer that the values are available
		FLAG <= '1';
		SCLK <= '0';
		
		wait for 40 ns;
		
		-- going back to a high clock (SCLK) and low FLAG state
		
		SCLK <= '1';
		FLAG <= '0';
		
		wait for 40 ns;
		
		-- ready for next run or end
	
	end loop;
	
	-- test part 2
	-- test for input without flag set
	-- 1. going back to idle and wait for 500ns to place a visible mark
	-- 2. set the max value but no FLAG
	
	LEFT_IN <= to_signed(0,18);
	RIGHT_IN <= to_signed(0,18);
	
	FLAG <= '1';
	SCLK <= '0';
	
	
	wait for 40 ns;
	
	SCLK <= '1';
	FLAG <= '0';
	
	wait for 500 ns;
	
	LEFT_IN <= to_signed(131071,18);
	RIGHT_IN <= to_signed(131071,18);
	
	-- setting SCLK LOW without setting the FLAG HIGH
	FLAG <= '0';
	SCLK <= '0';
	-- no output should be visible	
	
	wait for 100 ns;
	
	-- next try to set FLAG HIGH without changing SCLK
	
	FLAG <= '1';
	
	wait for 100 ns;
	
	-- end of test
	Wait;
	end process;
end bhvlogarithmiererTB;