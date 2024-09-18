LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU2 IS

PORT (Clock : IN STD_LOGIC; 							--CLOCK SIGNAL
		A ,B : IN UNSIGNED(7 DOWNTO 0);				--8 BIT INPUT FROM LATCHES
		OP: IN UNSIGNED(15 downto 0);					--16 BIT SELECTOR for OPERATION FROM DECODER
		Neg: OUT STD_LOGIC;								--NEGATIVE RESULT
		R1: OUT UNSIGNED(3 DOWNTO 0);					--lower 4bits of 8bits Result
		R2: OUT UNSIGNED(3 DOWNTO 0));				--higher 4bits of 8bits Result
END ALU2;

ARCHITECTURE Behaviour OF ALU2 IS
SIGNAL Reg1, Reg2, Result, tmp: UNSIGNED(7 DOWNTO 0) := (OTHERS => '0');
SIGNAL Reg4: UNSIGNED(0 TO 7);
BEGIN

Reg1 <= A;
Reg2 <= B;
PROCESS (Clock, OP)
	BEGIN
		IF (rising_edge(Clock)) THEN
	    CASE OP IS
			WHEN "0000000000000001" =>          --REPLACE odd bit of A with odd bit of B //assuming starting from 0 to 8
				Result(0) <= Reg1(0); 
				Result(2) <= Reg1(2); 
				Result(4) <= Reg1(4); 
				Result(6) <= Reg1(6);
				Result(1) <= Reg2(1); 
				Result(3) <= Reg2(3); 
				Result(5) <= Reg2(5);
				Result(7) <= Reg2(7);
				neg <= '0';
			WHEN "0000000000000010"  => 			--NANDing A and B
				Neg <= '0';
				Result <= (Reg1 NAND Reg2);
			WHEN "0000000000000100" =>				--Sum A and B and then subtract by 5
				Result <= ((Reg1 + Reg2) - 5);
				IF (Result >= 0) THEN
					neg <= '0';
				ELSE
					neg <= '1';
				END IF;
			WHEN "0000000000001000" =>				--2's complement of B
				IF (Reg2(7) = '1')THEN
				Neg <= '1';
				Result <= not(Reg2 - 1);
				ELSE 
				Neg <= '0';
				Result <= Reg2;
				END IF;
			WHEN "0000000000010000" =>				--Invert even bits of B, Reg2
				Result(0) <= not(Reg2(0)); 
				Result(2) <= not(Reg2(2)); 
				Result(4) <= not(Reg2(4)); 
				Result(6) <= not(Reg2(6));
				Result(1) <= Reg2(1); 
				Result(3) <= Reg2(3); 
				Result(5) <= Reg2(5); 
				Result(7) <= Reg2(7);
				Neg <= '0';
			WHEN "0000000000100000" =>				--Shift A to left by 2 bits//
				Neg <= '0';
				Result <= Reg1 sll 2;
			WHEN "0000000001000000" =>				--null output//
				Neg <= '0';
				Result <= "00000000";
			WHEN "0000000010000000" =>				--2's complement of A//
				IF (Reg1(7) = '1')THEN
				Neg <= '1';
				Result <= not(Reg1 - 1);
				ELSE 
				Neg <= '0';
				Result <= Reg1;
				END IF;
			WHEN "0000000100000000" =>				--Rotate B right by 2 bits//
				Neg <= '0';
				Result <= Reg2 ror 2;
			WHEN OTHERS =>-- Don't care
				result <= "00000000";
				neg <= '0';
		END CASE;
	END IF;
END PROCESS;
R1 <= Result(3 DOWNTO 0);
R2 <= Result(7 DOWNTO 4);

END Behaviour;