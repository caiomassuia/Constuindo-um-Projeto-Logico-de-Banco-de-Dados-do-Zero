
use OFICINA;
-- Recuperações simples com SELECT Statement
select * from Cliente;

-- Filtros com WHERE Statement
select * from Cliente where Nome like 'J%';

-- Crie expressões para gerar atributos derivados
-- Select * from servico;
select (sum(ValorPecas)+sum(ValorMaoDeObra)) as ValorTotal from Servico;

-- Defina ordenações dos dados com ORDER BY
select Descricao, (ValorPecas + ValorMaoDeObra) as Total from Servico order by Total asc;

-- Condições de filtros aos grupos – HAVING Statement
select * From ServicoPeca;
select idPeca from ServicoPeca group by idPeca having count(idPeca)<2;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
 select * from cliente;
 select * From StatusOrdemServico;
  select * from OrdemServico;
 
select c.Nome
    from Cliente as c
    inner join OrdemServico as o on o.id = c.idCliente
    inner join StatusOrdemServico  as so on so.idStatusOs = o.idStatusOrdemServico
	WHERE
    so.Identificacao = 'EM ABERTO'
