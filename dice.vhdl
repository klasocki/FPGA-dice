library ieee;
use ieee.std_logic_1164.all;

entity dice is
	port(
		clk, button:	in std_logic;
		seven_seg_out, seven_seg_out2:		out std_logic_vector (0 to 6)
	);
end dice;

architecture arch of dice is
begin
	process
		variable state : integer range 1 to 7;
		variable state2 : integer range 1 to 9;
	begin
		wait until clk'event and clk = '1';
		if button = '0' then 
			state:= state + 1;
			state2:= state2 + 3;
			if state = 7 
				then state := 1;
			end if;
			if state2 > 6 
				then state2 := (state2 + state) mod 6 + 1;
			end if;

		end if;	
					
		case state is
				when 1 => seven_seg_out <= "1111001";
				when 2 => seven_seg_out <= "0100100";
				when 3 => seven_seg_out <= "0110000";
				when 4 => seven_seg_out <= "0011001";
				when 5 => seven_seg_out <= "0010010";
				when 6 => seven_seg_out <= "0000010";
				when others => seven_seg_out <= "0000000";
		end case;

case state2 is
				when 1 => seven_seg_out2 <= "1111001";
				when 2 => seven_seg_out2 <= "0100100";
				when 3 => seven_seg_out2 <= "0110000";
				when 4 => seven_seg_out2 <= "0011001";
				when 5 => seven_seg_out2 <= "0010010";
				when 6 => seven_seg_out2 <= "0000010";
				when others => seven_seg_out2 <= "0000000";
		end case;
	end process;
end arch;
