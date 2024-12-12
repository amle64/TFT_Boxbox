DROP TABLE IF EXISTS public.matches;
DROP TABLE IF EXISTS public.traits;
DROP TABLE IF EXISTS public.trait_tier;

CREATE TABLE public.matches (
    match_id VARCHAR(30) PRIMARY KEY UNIQUE,
    traits JSON NOT NULL
);

--Starts at 13 to denote TFT set being played currently with the 13001 being the first id number for traits
CREATE SEQUENCE trait_id_seq START WITH 13001 INCREMENT BY 1;

CREATE TABLE public.traits (
    trait_id INT PRIMARY KEY DEFAULT nextval('trait_id_seq'),
    trait_name VARCHAR(50)
);

CREATE TABLE public.trait_tier(
    trait_id INT,
    tier_id INT,
    min_units INT,
    max_units INT,
    tier_name VARCHAR(20),
    PRIMARY KEY (trait_id, tier_id)
);

--All of the traits from Patch 14.23, Set 13
--Will need an update once new patch introduces new units soon
--Reference https://dotesports.com/tft/news/tft-set-13-trait-cheat-sheet#h-all-origin-traits-in-tft-set-13
INSERT INTO traits(trait_name)
VALUES  ('Academy'),
		('Automata'),
		('Black Rose'),
		('Chem-Baron'),
		('Conqueror'),
		('Emissary'),
		('Enforcer'),
		('Experiment'),
		('Family'),
		('Firelight'),
		('Junker King'),
		('Rebel'),
		('Scrap'),
		('Ambusher'),
		('Artillerist'),
		('Bruiser'),
		('Dominator'),
		('Form Swapper'),
		('Pit Fighter'),
		('Quickstriker'),
		('Sentinel'),
		('Sniper'),
		('Sorcerer'),
		('Visionary'),
		('Watcher')