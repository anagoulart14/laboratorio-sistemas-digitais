library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_MaquinaVendas is
    port(
        clock_tb    : out STD_LOGIC;
        A_tb        : out STD_LOGIC_VECTOR(1 downto 0);
        Produto_tb  : in STD_LOGIC;
        Troco25_tb  : in STD_LOGIC;
        Troco50_tb  : in STD_LOGIC
    );
end entity tb_MaquinaVendas;

architecture simulacao of tb_MaquinaVendas is

begin
    process -- Geracao do clock
    begin
        while true loop 
            clock_tb <= '0';
            wait for 10 ns;
            clock_tb <= '1';
            wait for 10 ns;
        end loop;
    end process;

    process -- Geracao dos estimulos
    begin
        A_tb <= "00"; -- Inicializacao
        wait for 20 ns;

        -- Caso 1 - 25 + 25 + 25 + 25 = Produto
        
        A_tb <= "01"; -- +25
        wait for 20 ns;
        A_tb <= "01"; -- +25
        wait for 20 ns;
        A_tb <= "01"; -- +25
        wait for 20 ns;
        A_tb <= "01"; -- +25
        wait for 20 ns;
        A_tb <= "00"; -- =100 ->produto 1 e volta pro inicio
        wait for 20 ns;

        -- Caso 2 - 50 + 50 = Produto
        
        A_tb <= "10";
        wait for 20 ns;
        A_tb <= "10";
        wait for 20 ns;
        A_tb <= "00";
        wait for 20 ns;

        -- Caso 3 - 50 + 25 + 50 = Produto + Troco25

        A_tb <= "10";
        wait for 20 ns;
        A_tb <= "01";
        wait for 20 ns;
        A_tb <= "10";
        wait for 20 ns;
        A_tb <= "00";
        wait for 20 ns;

        -- Caso 4 - Cancelamento com 25

        A_tb <= "01";
        wait for 20 ns;
        A_tb <= "11";
        wait for 20 ns;
        A_tb <= "00";
        wait for 20 ns;

        -- Caso 5 - Cancelamento com 50

        A_tb <= "10";
        wait for 20 ns;
        A_tb <= "11";
        wait for 20 ns;
        A_tb <= "00";
        wait for 20 ns;

       -- Caso 6 - Cancelamento com 75

        A_tb <= "10";
        wait for 20 ns;
        A_tb <= "01";
        wait for 20 ns;
        A_tb <= "11";
        wait for 20 ns;
        A_tb <= "00";
        wait for 20 ns;

        report "Simulacao finalizada com sucesso."
        severity note;
        wait;
    end process;
end architecture simulacao;