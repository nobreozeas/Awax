#1) Gerar um relatório que exiba o valor total dos produtos (preço de venda) agrupados por
#categoria, em ordem alfabética. (1,0)

select distinct
	c.nome_categoria,
    sum(p.preco_venda * p.qtd_estoque) valor_total 
from produto p
inner join categoria c on
	c.cod_categoria = p.cod_categoria
group by c.nome_categoria;

 
#2) Selecione os dados do produto, conforme abaixo, do produto com o menor preço de
#venda. (1,0)

    
    select distinct p.nome_produto, nome_categoria, m.nome_marca, p.nome_produto, p.preco_venda
    from produto p,  categoria c, marca m, itens_venda ie
   where p.cod_categoria=c.cod_categoria
   and p.cod_marca=m.cod_marca
   and p.preco_venda=(select min(preco_venda) from produto);
    
    

#3) Gerar um relatório que exiba a quantidade total em estoque dos produtos cadastrados
#agrupados por categoria e marca, ordenando por ordem alfabética de categoria, seguido
#de marca. (1,0)
   select
	c.nome_categoria,
    m.nome_marca,
    p.qtd_estoque quantidade
from produto p
left outer join marca m on
	p.cod_marca = m.cod_marca
left outer join categoria c on
	p.cod_categoria = c.cod_categoria
    
group by c.nome_categoria, m.nome_marca
order by c.nome_categoria, m.nome_marca;
;

#4) Crie um relatório que exiba o nome da marca, a quantidade total de produtos vendidos e
#o valor total desses produtos, das três marcas: Apple, Samsung e Dell. (1,0)
select
	m.nome_marca,
    sum(it.quantidade)  qtd_total,
	sum(it.quantidade) * p.preco_venda valor_total
from produto p
left outer join marca m on
	p.cod_marca = m.cod_marca
left outer join itens_venda it on
	p.cod_produto = it.cod_produto
where m.cod_marca in (1,2,6)
group by m.nome_marca
order by sum(it.quantidade) desc;

#5) Crie um relatório que exiba o total de vendas por tipo de pessoa e categoria. (1,0)
#5
select distinct
	ps.tipo_pessoa,
    c.nome_categoria,
    it.valor_unitario total
from pessoa ps
left outer join venda v on
	ps.cod_pessoa = v.cod_pessoa
left outer join itens_venda it on
	v.cod_venda = it.cod_venda
left outer join produto p on
	it.cod_produto = p.cod_produto
left outer join categoria c on
	p.cod_produto = c.cod_categoria
group by ps.tipo_pessoa, c.nome_categoria;

#6) Crie uma um relatório com as vendas para pessoas físicas e jurídicas. Os seguintes
#   campos são necessários: nome, cpf, cnpj, tipo, data da venda e total da venda. (1,0)
select
	pe.cod_pessoa,
	pe.nome,
    pe.cpf,
    pe.cnpj,
    pe.tipo_pessoa,
    v.data,
	count(it.cod_venda) * it.valor_unitario total
    
from pessoa pe
left outer join venda v on
 pe.cod_pessoa = v.cod_pessoa
 left outer join itens_venda it on
 v.cod_venda = it.cod_venda
 left outer join produto p on
  it.cod_produto = p.cod_produto
where
	v.data is not null
group by pe.nome,
    pe.cpf,
    pe.cnpj,
    pe.tipo_pessoa,
    v.data;

#7) Crie um relatório para exibir o código da venda, produto, preço de custo do produto,
#valor unitário da venda do produto e calcule o percentual de lucro sobre o preço de custo
#deste produto. Ordene pelo código da venda. (1,0)
select
	v.cod_venda,
    p.nome_produto,
    p.preco_custo,
    it.valor_unitario,
    ((p.preco_venda - p.preco_custo)/p.preco_custo)*100 as lucro_total
from produto p
left outer join itens_venda it on
p.cod_produto = it.cod_produto
inner join venda v on
it.cod_venda = v.cod_venda;
    
