LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Test IS
PORT ( OP1, OP2, OP3, OP4 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		 OPP : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END Test;

ARCHITECTURE Behavior OF Test IS
BEGIN
	OPP(0) <= OP1(3);
	OPP(1) <= OP1(2);
	OPP(2) <= OP1(1);
	OPP(3) <= OP1(0);	
	OPP(4) <= OP2(3);
	OPP(5) <= OP2(2);
	OPP(6) <= OP2(1);
	OPP(7) <= OP2(0);	
	OPP(8) <= OP3(3);
	OPP(9) <= OP3(2);
	OPP(10) <= OP3(1);
	OPP(11) <= OP3(0);	
	OPP(12) <= OP4(3);
	OPP(13) <= OP4(2);
	OPP(14) <= OP4(1);
	OPP(15) <= OP4(0);		
END Behavior;