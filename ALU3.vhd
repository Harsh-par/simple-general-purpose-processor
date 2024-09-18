LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU3 IS

PORT (Clock : IN STD_LOGIC; 							--CLOCK SIGNAL
		A ,B : IN UNSIGNED(7 DOWNTO 0);				--8 BIT INPUT FROM LATCHES
		Student_id: IN UNSIGNED(3 DOWNTO 0);		--4 BIT STUDENT ID FROM FSM
		OP: IN UNSIGNED(15 downto 0);					--16 BIT SELECTOR for OPERATION FROM DECODER
		Neg: OUT STD_LOGIC;								--NEGATIVE RESULT
		Result1: OUT UNSIGNED(3 DOWNTO 0));		   --lower 4bits of 8bits Result
END ALU3;

ARCHITECTURE Behavior OF ALU3 IS
SIGNAL Reg1, Reg2, Reg3, Result: UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
SIGNAL Reg5: UNSIGNED(0 TO 7);
BEGIN

Reg1 <= A(7 DOWNTO 4);
Reg2 <= A(3 DOWNTO 0);
Reg3 <= Student_id(3 DOWNTO 0);
PROCESS (Clock, OP)
	BEGIN
		IF (rising_edge(Clock)) THEN
	    CASE OP IS
			WHEN "0000000000000001" => 
				IF((Reg1 > Reg3) OR (Reg2 > Reg3)) THEN
				Result <= "0000";
				ELSE
				Result <= "0001";
				END IF;
			WHEN "0000000000000010"  => 			
				IF((Reg1 > Reg3) OR (Reg2 > Reg3)) THEN
				Result <= "0000";
				ELSE
				Result <= "0001";
				END IF;
			WHEN "0000000000000100" =>				
				IF((Reg1 > Reg3) OR (Reg2 > Reg3)) THEN
				Result <= "0000";
				ELSE
				Result <= "0001";
				END IF;
			WHEN "0000000000001000" =>			
				IF((Reg1 > Reg3) OR (Reg2 > Reg3)) THEN
				Result <= "0000";
				ELSE
				Result <= "0001";
				END IF;
			WHEN "0000000000010000" =>				
				IF((Reg1 > Reg3) OR (Reg2 > Reg3)) THEN
				Result <= "0000";
				ELSE
				Result <= "0001";
				END IF;
			WHEN "0000000000100000" =>			
				IF((Reg1 > Reg3) OR (Reg2 > Reg3)) THEN
				Result <= "0000";
				ELSE
				Result <= "0001";
				END IF;
			WHEN "0000000001000000" =>				
				IF((Reg1 > Reg3) OR (Reg2 > Reg3)) THEN
				Result <= "0000";
				ELSE
				Result <= "0001";
				END IF;
			WHEN "0000000010000000" =>				
				IF((Reg1 > Reg3) OR (Reg2 > Reg3)) THEN
				Result <= "0000";
				ELSE
				Result <= "0001";
				END IF;
			WHEN "0000000100000000" =>				
				IF((Reg1 > Reg3) OR (Reg2 > Reg3)) THEN
				Result <= "0000";
				ELSE
				Result <= "0001";
				END IF;
			WHEN OTHERS =>-- Don't care
		END CASE;
	END IF;
END PROCESS;
Result1 <= Result;
END Behavior;