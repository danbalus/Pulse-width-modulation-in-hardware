----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2018 07:41:53 PM
-- Design Name: 
-- Module Name: fading_led - Behavioral
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

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
-- entity fading_led
ENTITY fading_led IS
 PORT(
  -- LEDs da placa 
  LED:  OUT STD_LOGIC_VECTOR (9 downto 0);
  --  clock da la placa
  Clk:IN  STD_LOGIC
 );
END fading_led;

ARCHITECTURE behavioral OF fading_led IS
 COMPONENT fading_freq IS
  PORT(
   Clk:   IN STD_LOGIC;
   CONT:   OUT INTEGER RANGE 0 TO 100
  );
 END COMPONENT;

 COMPONENT fading_pwm IS
  PORT(
   Clk: IN STD_LOGIC;
   COUNTER: IN INTEGER RANGE 0 TO 100;
   LED: OUT STD_LOGIC_VECTOR (9 downto 0)
  );
 END COMPONENT;

 SIGNAL cnt: INTEGER RANGE 0 TO 100;
BEGIN

 --cnt trece prin fading_freq ?i fading_pwm
 fading_freq_i: fading_freq PORT MAP(Clk, cnt);
 fading_pwm_i: fading_pwm PORT MAP(Clk, cnt, LED);
END behavioral;
