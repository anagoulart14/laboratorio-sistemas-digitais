library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TopModule_03 is
end entity TopModule_03;

architecture estrutural of TopModule_03 is

    component MaquinaVendas
        port(
            clock    : in  STD_LOGIC;
            A        : in  STD_LOGIC_VECTOR(1 downto 0);
            Produto  : out STD_LOGIC;
            Troco25  : out STD_LOGIC;
            Troco50  : out STD_LOGIC
        );
    end component;

    component tb_MaquinaVendas
        port(
            clock_tb    : out STD_LOGIC;
            A_tb        : out STD_LOGIC_VECTOR(1 downto 0);
            Produto_tb  : in STD_LOGIC;
            Troco25_tb  : in STD_LOGIC;
            Troco50_tb  : in STD_LOGIC
        );
    end component;

    signal clock_s    : STD_LOGIC;
    signal A_s        : STD_LOGIC_VECTOR(1 downto 0);
    signal Produto_s  : STD_LOGIC;
    signal Troco25_s  : STD_LOGIC;
    signal Troco50_s  : STD_LOGIC;

begin

    DUT : MaquinaVendas
    port map(
        clock    => clock_s,
        A        => A_s,
        Produto  => Produto_s,
        Troco25  => Troco25_s,
        Troco50  => Troco50_s
    );

    Testbench : tb_MaquinaVendas
    port map(
        clock_tb    => clock_s,
        A_tb        => A_s,
        Produto_tb  => Produto_s,
        Troco25_tb  => Troco25_s,
        Troco50_tb  => Troco50_s
    );

end architecture estrutural;