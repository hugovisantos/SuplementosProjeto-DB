CREATE DATABASE LOJASUPLEMENTOS 
 
CREATE TABLE PAIS(
    IDPais int not null identity primary key,
    NomePais varchar(50) not null					
    select * from PAIS
    INSERT INTO PAIS(NomePais)VALUES ('Brasil') 
    INSERT into PAIS(NomePais)VALUES ('Estados Unidos')
    INSERT into PAIS(NomePais)VALUES ('Canadá')
    INSERT into PAIS(NomePais)VALUES ('México')              
)
CREATE TABLE CARGOS(
    IDCargo int not null identity primary key,
    NomeCargo varchar(50) not null,
    SalarioCargo real not null
    select * from CARGOS
    insert into cargos (NomeCargo, SalarioCargo) values ('Gerente', 25000)
    insert into cargos (NomeCargo, SalarioCargo) values ('Representante', 10000)
    insert into cargos (NomeCargo, SalarioCargo) values ('Vendedor', 2500)
) 
CREATE TABLE LINHAS(
    IDLinha int not null identity primary key,
    NomeLinha varchar(50) not null
)					
CREATE TABLE STATUSPRODUTOS(
    IDStatusProduto int not null identity primary key,
    NomeStatusProduto varchar(50) not null
    select * from STATUSPRODUTOS
    INSERT into STATUSPRODUTOS (NomeStatusProduto) VALUES ('Disponível')
    INSERT into STATUSPRODUTOS (NomeStatusProduto) VALUES ('Indisponível')
)					
CREATE TABLE TIPODEPRODUTOS(
    IDTipoDeProduto int not null identity primary key,
    NomeTipoDeProduto varchar (50) not null
    select * FROM TIPODEPRODUTOS
    INSERT into TIPODEPRODUTOS (NomeTipoDeProduto) values ('Whey Concentrado')
    INSERT into TIPODEPRODUTOS (NomeTipoDeProduto) values ('Whey Isolado')
    INSERT into TIPODEPRODUTOS (NomeTipoDeProduto) values ('Whey Hidrolisado')
    INSERT into TIPODEPRODUTOS (NomeTipoDeProduto) values ('BCAA')
    INSERT into TIPODEPRODUTOS (NomeTipoDeProduto) values ('Creatina')
    INSERT into TIPODEPRODUTOS (NomeTipoDeProduto) values ('Termogênico')
)						
CREATE TABLE TRANSPORTADORA(
    IDTransportadora int not null identity primary key,
    NomeTransportadora varchar(50) not null
    select * from TRANSPORTADORA 
    INSERT into TRANSPORTADORA (NomeTransportadora) values ('Diálogo')
    INSERT into TRANSPORTADORA (NomeTransportadora) values ('Direct')
    INSERT into TRANSPORTADORA (NomeTransportadora) values ('Gollog')
    INSERT into TRANSPORTADORA (NomeTransportadora) values ('Jadlog')
    delete from TRANSPORTADORA WHERE IDTransportadora = 3
)						
CREATE TABLE TIPODEPAGAMENTOS(
    IDTipoDePagamentos int not null identity primary key,
    NomeTipoDePagamentos varchar(50) not null
    select * from TIPODEPAGAMENTOS
    insert into TIPODEPAGAMENTOS (NomeTipoDePagamentos) values ('Cartão de Crédito')
    insert into TIPODEPAGAMENTOS (NomeTipoDePagamentos) values ('Cartão de Débito')
    insert into TIPODEPAGAMENTOS (NomeTipoDePagamentos) values ('Boleto')
)
CREATE TABLE STATUSPEDIDOS(
    IDStatusPedido int not null identity primary key,
    NomeStatusPedido varchar(50) not null
    select * from STATUSPEDIDOS
    INSERT into STATUSPEDIDOS (NomeStatusPedido) values ('Aguardando Confirmação')
    INSERT into STATUSPEDIDOS (NomeStatusPedido) values ('Pedido Aprovado')
    INSERT into STATUSPEDIDOS (NomeStatusPedido) values ('Enviado para a transportadora')
    INSERT into STATUSPEDIDOS (NomeStatusPedido) values ('Saiu para entrega')
    INSERT into STATUSPEDIDOS (NomeStatusPedido) values ('Entregue')

)										
CREATE TABLE FORNECEDORES(
    IDFornecedor  int not null identity primary key,
    NomeFornecedor varchar(50) not null,
    IDPais int not null,
    foreign key (IDPais) references PAIS
    select * from PAIS
    select * from FORNECEDORES
    INSERT into FORNECEDORES (NomeFornecedor, IDPais) VALUES ('Optimum Nutrition', 2)
    INSERT into FORNECEDORES (NomeFornecedor, IDPais) VALUES ('Universal Nutrition', 2)
    INSERT into FORNECEDORES (NomeFornecedor, IDPais) VALUES ('Dymatize Nutrition', 2)
    INSERT into FORNECEDORES (NomeFornecedor, IDPais) VALUES ('Growth Supplements', 1)
    INSERT into FORNECEDORES (NomeFornecedor, IDPais) VALUES ('Probiótica', 1)
    INSERT into FORNECEDORES (NomeFornecedor, IDPais) VALUES ('IntegralMédica', 1)
    INSERT into FORNECEDORES (NomeFornecedor, IDPais) VALUES ('Max Titanium', 1)                    
)
CREATE TABLE EMPREGADOS(
    IDEmpregado int not null identity primary key,
    NomeEmpregado varchar(50) not null,
    TelefoneEmpregado int,
    EmailEmpregado varchar(50),
    IDCargo int not null, 
    NacionalidadeEmpregado int not null,
    foreign key (IDCargo) references CARGOS,
    foreign key (NacionalidadeEmpregado) references PAIS
)
CREATE TABLE CLIENTES(
    IDCliente int not null identity primary key,
    NomeCliente varchar(50) not null,
    EmailCliente varchar(50),
    TelefoneCliente int,
    CepCliente int not null,
    NumeroResidenciaCliente int not null,
    CidadeCliente varchar(50) not null,
    ComplementoCliente varchar(50),
    NacionalidadeCliente int not null,
    foreign key (NacionalidadeCliente) references PAIS
)
CREATE TABLE PRODUTOS(
    IDProduto int not null identity primary key,
    NomeProduto varchar(50) not null,
    ValorUnitario real not null,
    QuantidadeEmEstoque int,
    DescricaoProduto varchar(300),
    IDFornecedor int not null,
    IDTipoProduto int not null,
    IDStatusProduto int not null,
    IDLinha int not null,
    foreign key (IDFornecedor) references FORNECEDORES,
    foreign key (IDTipoProduto) references TIPODEPRODUTOS,
    foreign key (IDStatusProduto) references STATUSPRODUTOS,
    foreign key (IDLinha) references LINHAS
    select * from TIPODEPRODUTOS
    select * from PRODUTOS
    INSERT into PRODUTOS (NomeProduto, ValorUnitario, QuantidadeEmEstoque, DescricaoProduto, IDFornecedor, IDTipoDeProduto, IDStatusProduto) 
    values ('Whey 100%', 80, 1000, 'Proteína concentrada do soro de leite, aroma idêntico ao natural e sucralose (edulcorante). Contém aromatizante sintético idêntico ao natural', )
)			
CREATE TABLE ITENSPEDIDOS(
    IDItensPedido int not null identity primary key,
    QuantidadeProduto int not null,
    ValorPedido real not null,
    ValorProduto real not null,
    IDProduto int not null,
    foreign key (IDProduto) references PRODUTOS 							
)					
CREATE TABLE PEDIDOS(
    IDPedido int not null identity primary key,
    ValorFrete real not null,
    ValorTotal real not null,
    IDItensPedido int not null,
    IDTipoDePagamento int not null,
    IDStatusPedido int not null,
    IDClientes int not null,
    IDEmpregados int not null,
    IDTipoDeTransporte int not null,
    foreign key (IDItensPedido) references ITENSPEDIDOS,
    foreign key (IDTipoDePagamento) references TIPODEPAGAMENTOS,
    foreign key (IDStatusPedido) references STATUSPEDIDOS,
    foreign key (IDClientes) references CLIENTES,
    foreign key (IDEmpregados) references EMPREGADOS,
    foreign key (IDTipoDeTransporte) references TIPOSDETRANSPORTE
)		
CREATE TABLE TIPOSDETRANSPORTE(
    IDTipoDeTransporte int not null identity primary key,
    NomeTipoDeTransporte varchar(50) not null,
    Valor real not null,
    IDTransportadora int not null,
    foreign key (IDTransportadora) references TRANSPORTADORA 
    select * from TRANSPORTADORA
    select * from TIPOSDETRANSPORTE
    INSERT into TIPOSDETRANSPORTE (NomeTipoDeTransporte, Valor, IDTransportadora) values ('Econômico', 10.50, 1)
    INSERT into TIPOSDETRANSPORTE (NomeTipoDeTransporte, Valor, IDTransportadora) values ('Express', 16.00, 1)
    
    INSERT into TIPOSDETRANSPORTE (NomeTipoDeTransporte, Valor, IDTransportadora) values ('Econômico', 10.50, 2)
    INSERT into TIPOSDETRANSPORTE (NomeTipoDeTransporte, Valor, IDTransportadora) values ('Express', 10.50, 2)

    INSERT into TIPOSDETRANSPORTE (NomeTipoDeTransporte, Valor, IDTransportadora) values ('Econômico', 10.50, 4)
    INSERT into TIPOSDETRANSPORTE (NomeTipoDeTransporte, Valor, IDTransportadora) values ('Express', 10.50, 4)

    INSERT into TIPOSDETRANSPORTE (NomeTipoDeTransporte, Valor, IDTransportadora) values ('Econômico', 10.50, 5)
    INSERT into TIPOSDETRANSPORTE (NomeTipoDeTransporte, Valor, IDTransportadora) values ('Express', 10.50, 5)
)