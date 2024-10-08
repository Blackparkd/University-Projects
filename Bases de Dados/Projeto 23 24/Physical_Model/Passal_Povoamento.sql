-- POVOAMENTO

-- Povoamento da tabela CATEGORIA
INSERT INTO Categorias (IDCATEGORIA, DESIGNACAO) VALUES
(1, 'Concerto'),
(2, 'Apresentação de Rancho'),
(3, 'Espetáculo de magia'),
(4, 'Piquenique solidário'),
(5, 'Teatro'),
(6, 'Festa Popular'),
(7, 'Feira Medieval'),
(8, 'Feira do Artesanato');

-- Povoamento da tabela LOCALIZACAO
INSERT INTO LOCALIZACOES (IDLOCALIZACAO, LOCALIDADE, RUA, CODPOSTAL, CAPACIDADE) VALUES
(1, 'Vila Verde', 'Rua Principal, 123', '4730-123', 200),
(2, 'Vila Verde', 'Avenida Central, 456', '4700-456', 300),
(3, 'Vila Verde', 'Praça da Liberdade, 789', '4500-789', 500),
(4, 'Vila Verde', 'Rua do Estádio, 12', '4710-012', 1000),
(5, 'Vila Verde', 'Travessa da Vila, 1', '4780-423', 740);

-- Povoamento da tabela ORGANIZADOR
INSERT INTO ORGANIZADORES (IDORGANIZADOR, NOME, TIPO, EMAIL, TELEMOVEL) VALUES
(1, 'Fábio Pereira', 'Gerente', 'fabiosp11@gmail.com', '+351 912345678'),
(2, 'João Faria', 'Chefe', 'joao.faria@hotmail.pt', '+351 923456789'),
(3, 'Catarina Silva', 'Chefe', 'cata.silva@gmail.com', '+351 934567890'),
(4, 'Fernando Lopes', 'Chefe', 'fernandolopes@sapo.pt', '+351 915678901'),
(5, 'Pedro Oliveira', 'Colaborador', 'pedro.oliveira@gmail.com', '+351 936789012'),
(6, 'Sandra Silva', 'Colaborador', 'sandra.mss@hotmail.pt', '+351 967890123'),
(7, 'Carlos Martins', 'Colaborador', 'carlosmartins@gmail.com', '+351 928901234'),
(8, 'Marta Pereira', 'Colaborador', 'martapereira.56@sapo.pt', '+351 969012345'),
(9, 'Gustavo Silva', 'Colaborador', 'gus.silva@hotmail.pt', '+351 923615278'),
(10, 'Ana Filipa Castro', 'Colaborador', 'afilipacastro@gmail.com', '+351 967428467');

-- Povoamento da tabela ARTISTA
INSERT INTO ARTISTAS (IDARTISTA, NOME, PRECO, DESCRICAO, TELEMOVEL) VALUES
(1, 'Richie Campbell', 2500.00, 'Música Pop', '+351 912314552'),
(2, 'Grupo do Rancho Folclórico de Vila Verde', 525.50, 'Rancho Folclórico', '+351 922223446'),
(3, 'Mário Daniel', 1900.00, 'Mágico', '+351 933893333'),
(4, 'HybridTheoryPT', 1450.00, 'Música Pop/Rock', '+351 923140123'),
(5, 'David Fonseca', 1500.00, 'Música Pop', '+351 932145123'),
(6, 'Ricardo Araújo Pereira', 2000.00, 'Comediante', '+351 934521674'),
(7, 'Grupo de Teatro VV', 730.50, 'Apresentações teatrais', '252671829'),
(8, 'Diogo Piçarra', 1400.00, 'Música Pop', '+351 934512312'),
(9, 'Dillaz', 1250.00, 'Música Rap', '+351 917321908'),
(10, 'Miguel Araújo', 1700.00, 'Música Pop/Rock', '+351 967123657'),
(11, 'Os 4 e Meia', 1160.00, 'Música Pop/ Rock', '+351 965872167'),
(12, 'Bárbara Bandeira', 1300.00, 'Música Pop', '+351 932481093'),
(13, 'Moonspell', 1150.00, 'Música Metal', '+351 967428496'),
(14, 'Linda Martini', 850.00, 'Música Punk/Rock', '+351 912846312'),
(15, 'Ornatos Violeta', '1050.00', 'Música Rock', '+351 923019000'),
(16, 'Grupo de Rancho de Gilmonde', '430.50', 'Rancho Folclórico', '253789012'),
(17, 'Pedro Abrunhosa', 1200.00, 'Música Pop/Rock', '+351 918891981'),
(18, 'Tony Carreira', 1550.00, 'Música Pop', '+351 912911122'),
(19, 'Morten', 1420.00, 'Música Eletrónica', '+46 978123125'),
(20, 'Bispo', 1400.00, 'Música Rap', '+351 933300003'),
(21, 'Kura', 1320.00,'Música Eletrónica', '+351 911999909');

-- Povoamento da tabela EVENTO
INSERT INTO EVENTOS (IDEVENTO, DataInicio, DataFim, GASTO, LOCALIZACAO, CATEGORIA) VALUES
(1, '2023-01-15 19:00:00', '2023-01-15 23:00:00', 0, 1, 1),
(2, '2023-02-20 14:30:00', '2023-02-20 15:30:00', 0, 2, 2),
(3, '2023-03-10 09:00:00', '2023-03-10 10:30:00', 0, 3, 3),
(4, '2024-02-10 14:30:00', '2024-02-10 19:00:00', 0, 3, 4),	
(5, '2024-05-01 15:30:00', '2024-05-01 17:30:00', 0, 2, 5),
(6, '2024-06-15 14:00:00', '2024-06-19 02:00:00', 0, 5, 6),
(7, '2023-08-10 12:30:00', '2023-08-18 23:00:00', 0, 2, 8),
(8, '2023-09-15 15:30:00', '2023-09-22 23:59:00', 0, 5, 7),
(9, '2024-03-25 21:00:00', '2024-03-26 02:30:00', 0, 1, 1),
(10, '2023-12-10 16:00:00', '2023-12-15 19:00:00', 0, 5, 6),
(11, '2024-07-28 12:30:00', '2024-08-05 23:00:00', 0, 2, 8),
(12, '2024-08-20 15:00:00', '2024-08-28 23:00:00', 0, 5, 7),
(13, '2024-05-24 17:30:00', '2024-05-24 20:00:00', 0, 3, 2),
(14, '2024-01-11 17:00:00', '2024-01-12 02:00:00', 0, 1, 1),
(15, '2024-04-25 14:00:00', '2024-04-25 21:30:00', 0, 4, 1),
(16, '2024-02-01 20:30:00', '2024-02-01 23:45:00', 0, 4, 5);

-- Povoamento da tabela ORGANIZADOR_EVENTO
INSERT INTO ORGANIZADORES_EVENTOS (ORGANIZADOR, EVENTO) VALUES
-- Evento 1
(1, 1), -- Gerente (IDOrganizador 1)
(2, 1), -- Chefe (IDOrganizador 2)
(5, 1), -- Outro organizador (pode ser qualquer ID diferente de 1, 2, 3 ou 4)
(7, 1),
(8, 1),
(9, 1),
(10, 1),
-- Evento 2
(2, 2), -- Chefe (IDOrganizador 2)
(3, 2), -- Chefe (IDOrganizador 3)
(6, 2), -- Outro organizador (pode ser qualquer ID diferente de 1, 2, 3 ou 4)
(7, 2),
-- evento 3
(1, 3), -- Gerente (IDOrganizador 1)
(4, 3), -- Chefe (IDOrganizador 4)
(7, 3), -- Outro organizador (pode ser qualquer ID diferente de 1, 2, 3 ou 4)
(9, 3),
-- Evento 4
(3, 4), -- Chefe (IDOrganizador 3)
(4, 4), -- Chefe (IDOrganizador 4)
(5, 4), -- Outro organizador (pode ser qualquer ID diferente de 1, 2, 3 ou 4)
(6, 4),
(9, 4),
-- Evento 5
(4, 5), -- Chefe (IDOrganizador 4)
(1, 5), -- Gerente (IDOrganizador 1)
(9, 5), -- Outro organizador (pode ser qualquer ID diferente de 1, 2, 3 ou 4)
-- Evento 6
(1, 6),
(2, 6), -- Chefe (IDOrganizador 2)
(3, 6), -- Chefe (IDOrganizador 3)
(4, 6),
(5, 6),
(6, 6),
(7, 6),
(8, 6),
(9, 6),
(10, 6), -- Outro organizador (pode ser qualquer ID diferente de 1, 2, 3 ou 4);
-- Evento 7
(1, 7), -- Gerente (IDOrganizador 1)
(2, 7),
(3, 7),
(5, 7), -- Outro organizador (pode ser qualquer ID diferente de 1, 2, 3 ou 4)
(6, 7),
(7, 7), -- Colaborador (IDOrganizador 7)
(8, 7),
(9, 7),
(10, 7),
-- Evento 8
(1, 8),
(2, 8), -- Chefe (IDOrganizador 2)
(3, 8),
(4, 8),
(5, 8),
(6, 8), -- Outro organizador (pode ser qualquer ID diferente de 1, 2, 3 ou 4)
(7, 8),
(8, 8), -- Colaborador (IDOrganizador 8)
(9, 8),
(10, 8),
-- Evento 9
(1, 9),
(2, 9),
(3, 9), -- Chefe (IDOrganizador 3)
(4, 9),
(7, 9),
(9, 9), -- Outro organizador (pode ser qualquer ID diferente de 1, 2, 3 ou 4)
(10, 9), -- Colaborador (IDOrganizador 10);
-- Evento 10
(1, 10),
(2, 10),
(3, 10),
(4, 10), -- Chefe (IDOrganizador 4)
(5, 10),
(6, 10),
(7, 10), -- Colaborador (IDOrganizador 7)
(9, 10), -- Outro organizador (pode ser qualquer ID diferente de 1, 2, 3 ou 4)
-- Evento 11
(1, 11), -- Gerente (IDOrganizador 1)
(2, 11),
(3, 11),
(4, 11),
(5, 11),
(6, 11), -- Outro organizador (pode ser qualquer ID diferente de 1, 2, 3 ou 4)
(8, 11), -- Colaborador (IDOrganizador 8)
(9, 11),
(10, 11),
-- Evento 12
(1, 12),
(2, 12),
(3, 12), -- Chefe (IDOrganizador 3)
(4, 12),
(5, 12), -- Outro organizador (pode ser qualquer ID diferente de 1, 2, 3 ou 4)
(6, 12),
(7, 12),
(8, 12),
(9, 12),
(10, 12), -- Colaborador (IDOrganizador 10);
-- Evento 13
(1, 13), -- Gerente (IDOrganizador 1)
(4, 13), -- Chefe (IDOrganizador 4)
(6, 13),-- Outro organizador (pode ser qualquer ID diferente de 1, 2, 3 ou 4)
(9, 13),
(10, 13),
-- Evento 14
(2, 14), -- Chefe (IDOrganizador 2)
(3, 14),
(4, 14),
(5, 14),
(6, 14),
(7, 14), -- Colaborador (IDOrganizador 7)
(9, 14), -- Outro organizador (pode ser qualquer ID diferente de 1, 2, 3 ou 4)
-- Evento 15
(1, 15),
(3, 15), -- Chefe (IDOrganizador 3)
(5, 15), -- Outro organizador (pode ser qualquer ID diferente de 1, 2, 3 ou 4)
(6, 15),
(8, 15), -- Colaborador (IDOrganizador 8);
(9, 15),
(10, 15),
-- Evento 16
(1, 16), -- Gerente (IDOrganizador 1)
(2, 16), -- Chefe (IDOrganizador 2)
(5, 16), -- Colaborador (IDOrganizador 10);
(6, 16);

-- Povoamento da tabela EVENTO_ARTISTA
INSERT INTO eventos_artistas (EVENTO, ARTISTA) VALUES
-- evento 1
(1,11),(1,1),
-- evento 2
(2,2),
-- evento 3
(3,3),
-- evento 4
(4,12),
-- evento 5
(5,7),
-- evento 6
(6,9),(6,15),(6,16),(6,8),(6,5),
-- evento 7
(7,10),(7,2),
-- evento 8
(8,2),(8,16),(8,7),
-- evento 9
(9,2),(9,13),
-- evento 10
(10,6),(10,1),(10,11),(10,3),(10,2),(10,14),(10,9),
-- evento 11
(11,2),(11,5),(11,15),
-- evento 12
(12,2),(12,16),(12,7),(12,14),
-- evento 13
(13,2),(13,16),
-- evento 14
(14,17),(14,18),
-- evento 15
(15,19),(15,20),(15,21),
-- evento 16
(16,7);
