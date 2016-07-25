-- helpFunc subprogram

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
	
-- defining the package
 package helpFunc is
	-- defining the function in the package
	function mapInputToOutput (inputVal : signed(17 downto 0)) return std_logic_vector;
 end helpFunc;
	 
 package body helpFunc is
	-- implementation of the function
	-- function: mapInputToOutput
	-- convert the signed 18 bit input to a positiv integer and
	-- then maps the positiv integer to a 4 bit std_logic_vector
	-- if the input is zero, 
	--    the output will be zero
	-- if the input is maxed out (positiv: 131071, negativ: -131072)
	--    the output will be maxed out (dec:15 or bin:'1111')
	function mapInputToOutput(inputVal : signed(17 downto 0)) return std_logic_vector is 
		-- defining a help variable to hold the positiv value
		variable absValue : integer range 0 to 131072;
	 begin		
		
		-- if positiv simply assign the value
		if inputVal > 0 then
			absValue := to_integer(inputVal(17 downto 0));
		else
		-- if negativ invert the value, the assign it
			absValue := 0 - to_integer(inputVal(17 downto 0));
		end if;
		
		-- return the correct value accourding to the lookup table
		case absValue is
			when 0 to 29246 		=> return "0000"; -- -30db
			when 29247 to 32322    	=> return "0001"; -- -28db
			when 32323 to 35721   	=> return "0010"; -- -26db
			when 35722 to 39478 	=> return "0011"; -- -24db
			when 39479 to 43630    	=> return "0100"; -- -22db
			when 43631 to 48219		=> return "0101"; -- -20db
			when 48220 to 53290 	=> return "0110"; -- -18db
			when 53291 to 58894    	=> return "0111"; -- -16db
			when 58895 to 65088    	=> return "1000"; -- -14db
			when 65089 to 71934 	=> return "1001"; -- -12db
			when 71935 to 79499   	=> return "1010"; -- -10db
			when 79500 to 87860    	=> return "1011"; -- -08db
			when 87861 to 97101 	=> return "1100"; -- -06db
			when 97102 to 107313    => return "1101"; -- -04db
			when 107314 to 118599   => return "1110"; -- -02db
			when 118600 to 131072 	=> return "1111"; --  00db
		end case;
	 end function;		 
 end helpFunc;
