library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity m is 
    Port (btnC, btnU, btnL, btnR, btnD, ck:  in std_logic;     z: out std_logic_vector(3 downto 0)); end m; 

architecture beh of m is 
type my_state is (r, u, l, d);
signal n_s : my_state;
begin

process(ck)
begin
    if ck = '1' and ck'event then
        if btnC = '1' then n_s <= r;
    else
    
    case n_s is
        when r => z <= "0001";
            if btnU = '1' then n_s <= u;
            end if;
            if btnD = '1' then n_s <= d;
            end if;
        when u => z <= "0010";
            if btnL = '1' then n_s <= l;
            end if;
        when d => z <= "1000";
            if btnU = '1' then n_s <= u;
            end if;
        when l => z <= "0100";
    end case;
    end if;
    end if;
    end process;
    end beh;