LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY SSEG1 IS
PORT (
bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
leds: OUT STD_LOGIC_VECTOR(0 TO 6));
END SSEG1;

ARCHITECTURE Behavior OF SSEG1 IS
BEGIN
PROCESS (bcd)
BEGIN

CASE bcd IS --  abcdefg (if starting sseg is all on)
WHEN "0000" => leds <= ("1000100"); --y
WHEN "0001" => leds <= ("1101010"); --n
WHEN OTHERS => leds <= ("1111111");
END CASE;
END PROCESS;
END Behavior;

--inverted (to display number if starting sseg is all off)
--1111110
--0110000
--1101101
--1111001
--0110011
--1011011
--1011111
--1110000
--1111111
--1110011
--1110111
--0011111
--1001110
--0111101
--1001111
--1000111