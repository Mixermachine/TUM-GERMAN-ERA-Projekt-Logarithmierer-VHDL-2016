--  logarithmierer program.

-- importing the libs
 library ieee;
 use ieee.std_logic_1164.all;	 
 use ieee.numeric_std.all;
 
 -- make the helpFunc subprogram available
 library work;
 use work.helpFunc.all;
 
 
 --  Defining the entity
 entity logarithmierer is
	-- defining the in and out ports
	port(LEFT: IN signed (17 downto 0);
		 RIGHT: IN signed (17 downto 0);
		 FLAG: IN std_logic;
		 SCLK: IN std_logic;
		 
		 LOG_L: OUT std_logic_vector(3 downto 0);
		 LOG_R: OUT std_logic_vector(3 downto 0) 
		 );
 end logarithmierer;
 
 -- implementing the behaviour of the logarithmierer
 architecture behaviour of logarithmierer is

 begin
	process(SCLK)
	begin
		-- the input is available on the falling_edge of SCLK && FLAG = '1'
		if falling_edge(SCLK) and FLAG = '1' then
			-- map the input via the submethod mapInputToOutput(signed(17 downto 0)) to the output
			-- we use a submethod to avoid duplicated code. Don't repeat yourself.
			LOG_L <= mapInputToOutput(LEFT);
			LOG_R <= mapInputToOutput(RIGHT);
		end if;
	end process;
 end behaviour;
	 
	