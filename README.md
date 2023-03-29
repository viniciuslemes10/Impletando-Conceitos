# Implementando os conceitos de BDA em um projeto prático

### Selecionando as tabelas para criar a tabela virtual.
         SELECT * FROM  categorias;
         SELECT * FROM MOVIMENTOS;

### Tabela virtual:
Onde sua função é que o usuário tenha vizualização de ambas tabelas(categorias, movimentos).
Selecionando os principais campos, onde o valor da movimentação é somado, fazendo inner join das tabelas, agrupando pelos campos
e ordenando pelo valor_total.
       
        CREATE VIEW vw_mov_cat AS
        SELECT C.id_cat, nome_cat, descricao_cat,MV.idCategoria_mov,
        MV.data_mov, SUM(valor_mov) AS valor_total
        FROM CATEGORIAS C INNER JOIN MOVIMENTOS MV
        ON C.id_cat = MV.idCategoria_mov
        GROUP BY C.id_cat, nome_cat, descricao_cat,MV.idCategoria_mov,
        MV.data_mov
        ORDER BY valor_total DESC;

### Selecionando tabela virtual.
        SELECT * FROM vw_mov_cat;

### Criando usuário.
        CREATE USER 'Jonas_sr'@'localhost'IDENTIFIED BY'123456';

### Dando permissão ao usuário para vizualizar a tabela virtual criada.
        GRANT SELECT ON vw_mov_cat TO 'Jonas_sr'@'localhost';

### Vizualizando as permissões do usuário.
        SHOW GRANTS FOR 'Jonas_sr'@'localhost';
