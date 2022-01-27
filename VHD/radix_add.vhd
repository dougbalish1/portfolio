library IEEE;
use IEEE.STD_LOGIC_1164.ALL,
ieee.std_logic_unsigned.all;

entity radix_r_add is 
generic (r : natural := 5;
         n : natural := 3);
Port (
x, y : in std_logic_vector(n-1 downto 0);
   z : out std_logic_vector(n-1 downto 0);
ck, reset, btn0, btn1 : in std_logic
);
end radix_r_add;


architecture beh of radix_r_add is 
type my_state is (no_carry, carry);
signal n_s : my_state;
-- n - 1 bit signals for calculation 
signal temp_x, temp_y : std_logic_vector(n downto 0);
signal en, ck_0 : std_logic;
begin

process(en)
begin
ck_0 <= en;
end process;


temp_x <= '0'&x;
temp_y <= '0'&y;

process(ck, ck_0)
variable temp: std_logic_vector(n downto 0);
begin
if ck = '1' and ck'event and ck_0 = '1' then
    if reset = '1' then
        n_s <= no_carry;
        temp := (others => '0');
    else
    case n_s is 
    when no_carry =>
        temp := temp_x + temp_y;
        if temp > r - 1 then 
            n_s <= carry;
        end if;
    when carry =>
        temp := temp_x + temp_y;
        temp := temp + 1;
        if temp < r then
            n_s <= no_carry;
        end if;
    end case;
    if temp >= r then 
        temp := temp - r;
    end if;
    end if;
    end if; 
    z <= temp(n - 1 downto 0);
end process;

process(ck)
type db_state is (not_rdy, rdy, pulse);
variable db_ns: db_state;
begin
    if ck='1' and ck'event then 
        case db_ns is 
            when not_rdy => en <= '0';
                if btn1 = '1' then
                    db_ns := rdy;
                end if;
            when rdy => en <= '0';
                if btn0 = '1' then
                    db_ns := pulse;
                end if;
            when pulse => en <= '1';
                db_ns := not_rdy;
            when others => null;
        end case;
    end if;
end process;


end beh;

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     