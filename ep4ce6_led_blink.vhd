library ieee;
use ieee.std_logic_1164.all;

entity ep4ce6_led_blink is
    generic (
        CLOCK_HZ      : positive := 50_000_000;
        BLINK_HZ      : positive := 1;
        LED_ACTIVE_LOW : boolean := true;
        BUTTON_ACTIVE_LOW : boolean := true
    );
    port (
        clk     : in  std_logic;
        LEDS    : out std_logic_vector(4 downto 0);
        BUTTONS : in  std_logic_vector(3 downto 0);
        nRST    : in  std_logic
    );
end entity ep4ce6_led_blink;

architecture rtl of ep4ce6_led_blink is
    constant HALF_PERIOD : positive := CLOCK_HZ / (2 * BLINK_HZ);
    signal counter       : natural range 0 to HALF_PERIOD - 1 := 0;
    signal led_state     : std_logic := '0';
    signal button_led_on : std_logic_vector(3 downto 0);
begin
    process (clk, nRST)
    begin
        if nRST = '0' then
            counter   <= 0;
            led_state <= '0';
        elsif rising_edge(clk) then
            if counter = HALF_PERIOD - 1 then
                counter   <= 0;
                led_state <= not led_state;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    process (BUTTONS)
    begin
        if BUTTON_ACTIVE_LOW then
            button_led_on <= not BUTTONS;
        else
            button_led_on <= BUTTONS;
        end if;
    end process;

    process (led_state, button_led_on)
    begin
        if LED_ACTIVE_LOW then
            LEDS(3 downto 0) <= not button_led_on;
            LEDS(4) <= not led_state;
        else
            LEDS(3 downto 0) <= button_led_on;
            LEDS(4) <= led_state;
        end if;
    end process;
end architecture rtl;
