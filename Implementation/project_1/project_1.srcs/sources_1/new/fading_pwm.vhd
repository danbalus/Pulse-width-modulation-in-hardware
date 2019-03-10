----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2018 07:41:15 PM
-- Design Name: 
-- Module Name: fading_pwm - Behavioral
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
--on off led

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY fading_pwm IS
 PORT(
  -- clock, 
  Clk: IN STD_LOGIC;
  -- valoarea contorului provenit de la divisor de freq
  COUNTER: IN INTEGER RANGE 0 TO 100;
  -- iesire LEDs
  LED: OUT STD_LOGIC_VECTOR (9 downto 0)
 );
END fading_pwm;

ARCHITECTURE behavioral OF fading_pwm IS
 --  contorul PWM pentru compararea cu contorul de divizoare
 SIGNAL pwm_cont: INTEGER RANGE 0 TO 100;
 -- porni?i / opri?i LED-urile
 SIGNAL pwm_signal: STD_LOGIC := '0';
BEGIN
 PROCESS(Clk)
 BEGIN
  IF rising_edge(Clk) THEN
   --  dac? num?rul a ajuns la maxim
   IF (pwm_cont = 99) THEN
    pwm_cont <= 0;
   ELSE
    pwm_cont <= pwm_cont + 1;
   END IF;
  END IF;
-- dac? contorul pwm este mai mic decât contorul de divizoare
  IF(pwm_cont < COUNTER) THEN
  --aprind ledul
   pwm_signal <= '1';
  -- else opresc ledul
  ELSE 
   pwm_signal <= '0';
  END IF;
  --- exist? 10 LED-uri cu valoarea pwm_signal
  LED <= (OTHERS => pwm_signal);
 END PROCESS;
END behavioral;


