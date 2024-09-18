LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY SSEG IS
PORT (
bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
negative : IN STD_LOGIC;
leds, ledsSign : OUT STD_LOGIC_VECTOR(0 TO 6));
END SSEG;

ARCHITECTURE Behavior OF SSEG IS
BEGIN
PROCESS (bcd, negative)
BEGIN

if (negative = '0') then -- if 0, then unsigned
ledsSign <= ("1111111");-- set the sign to positive
end if;
if (negative = '1') then -- if 1, then signed
ledsSign <= ("1111110");-- set the sign to negative
end if;

CASE bcd IS --  abcdefg (if starting sseg is all on)
WHEN "0000" => leds <= ("0000001"); --0
WHEN "0001" => leds <= ("1001111"); --1
WHEN "0010" => leds <= ("0010010"); --2
WHEN "0011" => leds <= ("0000110"); --3
WHEN "0100" => leds <= ("1001100"); --4
WHEN "0101" => leds <= ("0100100"); --5
WHEN "0110" => leds <= ("0100000"); --6
WHEN "0111" => leds <= ("0001111"); --7
WHEN "1000" => leds <= ("0000000"); --8
WHEN "1001" => leds <= ("0001100"); --9
WHEN "1010" => leds <= ("0001000"); --A
WHEN "1011" => leds <= ("1100000"); --b
WHEN "1100" => leds <= ("0110001"); --C
WHEN "1101" => leds <= ("1000010"); --d
WHEN "1110" => leds <= ("0110000"); --E
WHEN "1111" => leds <= ("0111000"); --f
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