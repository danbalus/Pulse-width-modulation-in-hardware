----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2018 07:39:43 PM
-- Design Name: 
-- Module Name: fading_freq - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
--divizor de frec



LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY fading_freq IS
 -- contor pentru div. de frecven??. aproximativ 8 milisec.
 GENERIC(TEMPO: INTEGER := 400000);
 PORT(
  Clk:   IN STD_LOGIC;
  -- indic? procentajul de timp care r?mâne
  CONT:   OUT INTEGER RANGE 0 TO 100
 );
END fading_freq;

ARCHITECTURE behavioral OF fading_freq IS
 SIGNAL temporal: INTEGER RANGE 0 TO TEMPO;
 -- 0 = fade in | 1 = fade out
 SIGNAL fade_inout: STD_LOGIC := '0'; 
  -- Valoarea de ie?ire CONT

 SIGNAL cnt: INTEGER RANGE 0 TO 100;
BEGIN
 CONT <= cnt;
 PROCESS(Clk)
 BEGIN
  IF rising_edge(Clk) THEN
   -- - dac? se ajunge la TIME
   IF (temporal = TEMPO) THEN
    temporal <= 0;
    --  dac? cnt = 99%
    IF (cnt = 99) THEN
     -- executa fade out
     fade_inout <= '1';
    -- se cnt = 1%
    ELSIF (cnt = 1) THEN
     -- executa fade in
     fade_inout <= '0';
    END IF;
    -- fade in, incrementeaza timp
    -- fade out, decrementa timp.
    CASE fade_inout IS
     WHEN '0' => cnt <= cnt + 1;
     WHEN '1' => cnt <= cnt - 1;
    END CASE;
   -- - continua?i s? num?ra?i TIME
   ELSE
    temporal <= temporal + 1;
   END IF; 
  END IF;
 END PROCESS;
END behavioral;

