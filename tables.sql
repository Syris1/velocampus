create table adherents(
	id int(11) unique not null auto_increment,
	nom varchar(50),
	prenom varchar(50),
	date_naissance date,
	code_postal int(5) unsigned zerofill,
	telephone int(10) unsigned zerofill,
	mail varchar(50),
	password varchar(100),
	date_inscription datetime default current_timestamp,
	status int(11) default 5,
	password_reset_token varchar(50),
	auth_key varchar(50),
	primary key(id)
);

create table poste(
	id int(11) unique not null auto_increment,
	libelle varchar(50),
	primary key(id)
);

create table membre(
	id_adherent int(11),
	id_poste int(11),
	primary key(id_adherent,id_poste),
	constraint bureau foreign key (id_adherent) references adherent(id),
	constraint affectation foreign key (id_poste) references poste(id)
);

create table velo(
	id int(11) unique not null auto_increment,
	id_etat int(11),
	id_taille int(11),
	id_type int(11),
	caution float(5,2),
	primary key(id)
);

create table etat_velo(
	id int(11) unique not null auto_increment,
	libelle varchar(100),
	primary key(id)
);

create table taille_velo(
	id int(11) unique not null auto_increment,
	libelle varchar(100),
	primary key(id)
);
create table type_velo(
	id int(11) unique not null auto_increment,
	libelle varchar(100),
	primary key(id)
);

create table evenement(
	id int(11) unique not null auto_increment,
	titre varchar(25),
	lieu varchar(25),
	description text,
	date_debut date,
	date_fin date,
	date_creation datetime,
	id_createur int(11),
	primary key(id),
	constraint createur foreign key (id_createur) references membre(id_adherent)
);

create table location(
	id int(11) unique not null auto_increment,
	id_tarif int(11),
	date_location date,
	date_retour date,
	id_velo int(11),
	id_adherent int(11),
	primary key(id),
	constraint prix foreign key (id_tarif) references tarif(id),
	constraint velo_emprunt foreign key (id_velo) references velo(id),
	constraint utilisateur foreign key (id_adherent) references adherent(id)
);

create table news(
	id int(11) unique not null auto_increment,
	titre varchar(25),
	thumb varchar(25),
	description text,
	date_creation datetime,
	id_createur int(11),
	primary key(id),
	constraint createur foreign key (id_createur) references membre(id_adherent)
);

create table partenaire(
	id int(11) unique not null auto_increment,
	nom varchar(50),
	presentation text,
	photo varchar(70),
	website varchar(100),
	primary key (id)
);

create table type_objet(
	id int(11) unique not null auto_increment,
	libelle varchar(25),
	primary key(id)
);

create table etat_objet(
	id int(11) unique not null auto_increment,
	libelle varchar(25),
	primary key(id)
);

create table objet(
	id int(11) unique not null auto_increment,
	nom varchar(25),
	website varchar(200),
	id_type int(11),
	id_etat int(11),
	primary key(id)
	constraint est foreign key (id_type) references type_objet(id),
	constraint etat foreign key (id_etat) references etat_objet(id)
);

create table tarif(
	id int(11) unique not null auto_increment,
	nom varchar(25),
	prix float(5,2),
	primary key(id)
);