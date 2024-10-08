CREATE SCHEMA Passal;
USE Passal;

CREATE TABLE IF NOT EXISTS Categorias(
IdCategoria INT NOT NULL,
Designacao VARCHAR(45) NOT NULL,
PRIMARY KEY (IdCategoria)
);

CREATE TABLE IF NOT EXISTS Localizacoes(
IdLocalizacao INT NOT NULL,
Localidade VARCHAR(45) NOT NULL,
Rua VARCHAR(45) NOT NULL,
CodPostal VARCHAR(10) NOT NULL,
Capacidade INT NOT NULL,
PRIMARY KEY(IdLocalizacao)
);

CREATE TABLE IF NOT EXISTS Organizadores(
IdOrganizador INT NOT NULL,
Nome VARCHAR(100) NOT NULL,
Tipo VARCHAR(45) NOT NULL,
Email VARCHAR(75) NOT NULL,
Telemovel VARCHAR(20) NOT NULL,
PRIMARY KEY(IdOrganizador)
);

CREATE TABLE IF NOT EXISTS Artistas(
IdArtista INT NOT NULL,
Nome VARCHAR(100) NOT NULL,
Preco DECIMAL(7,2) NOT NULL,
Descricao VARCHAR(45) NOT NULL,
Telemovel VARCHAR(20) NOT NULL,
PRIMARY KEY(IdArtista)
);

CREATE TABLE IF NOT EXISTS Eventos(
IdEvento INT NOT NULL,
DataInicio DATETIME NOT NULL,
DataFim DATETIME NOT NULL,
Gasto DECIMAL(9,2) NOT NULL,
Localizacao INT NOT NULL,
Categoria INT NOT NULL,
PRIMARY KEY(IdEvento, Localizacao, Categoria),
FOREIGN KEY(Localizacao) REFERENCES Localizacoes(IdLocalizacao),
FOREIGN KEY(Categoria) REFERENCES Categorias(IdCategoria)
);

CREATE TABLE IF NOT EXISTS Organizadores_Eventos(
Organizador INT NOT NULL,
Evento INT NOT NULL,
PRIMARY KEY(Organizador, Evento),
FOREIGN KEY(Organizador) REFERENCES Organizadores(IdOrganizador),
FOREIGN KEY(Evento) REFERENCES Eventos(IdEvento)
);

CREATE TABLE IF NOT EXISTS Eventos_Artistas(
Evento INT NOT NULL,
Artista INT NOT NULL,
PRIMARY KEY(Evento, Artista),
FOREIGN KEY(Evento) REFERENCES Eventos(IdEvento),
FOREIGN KEY(Artista) REFERENCES Artistas(IdArtista)
);
