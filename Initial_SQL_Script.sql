--Drop tables as needed
DROP TABLE IF EXISTS public.matches;
DROP TABLE IF EXISTS public.traits;
DROP TABLE IF EXISTS public.trait_tier;

CREATE TABLE public.matches (
    match_id VARCHAR(30) PRIMARY KEY UNIQUE,
    traits JSON NOT NULL
);

--Reset the sequence if rerunning the script
DROP SEQUENCE IF EXISTS trait_id_seq;

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

--All of the traits from Patch 14.24, Set 13
--Reference https://dotesports.com/tft/news/tft-set-13-trait-cheat-sheet#h-all-origin-traits-in-tft-set-13 (this is from 14.23)
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
		('Watcher'),
		('Blood Hunter'),
		('Machine Herald'),
		('Banished Mage');

INSERT INTO trait_tier (trait_id, tier_id, min_units, max_units, tier_name)
VALUES
    -- Academy
    (13001, 1, 3, 6, 'Bronze'),
    (13001, 2, 4, 6, 'Silver'),
    (13001, 3, 5, 6, 'Gold'),
    (13001, 4, 6, 6, 'Prismatic'),
    -- Automata
    (13002, 1, 2, 6, 'Bronze'),
    (13002, 2, 4, 6, 'Silver'),
    (13002, 3, 6, 6, 'Gold'),
    -- Black Rose
    (13003, 1, 3, 7, 'Bronze'),
    (13003, 2, 4, 7, 'Silver'),
    (13003, 3, 5, 7, 'Gold'),
    (13003, 4, 7, 7, 'Prismatic'),
    -- Chem-Baron
    (13004, 1, 3, 7, 'Bronze'),
    (13004, 2, 4, 7, 'Silver'),
    (13004, 3, 5, 7, 'Silver'),
	(13004, 4, 6, 7, 'Gold'),
	(13004, 5, 7, 7, 'Prismatic'),
    -- Conqueror
    (13005, 1, 2, 9, 'Bronze'),
    (13005, 2, 4, 9, 'Silver'),
    (13005, 3, 6, 9, 'Gold'),
	(13005, 4, 9, 9, 'Prismatic'),
    -- Emissary
    (13006, 1, 1, 4, 'Bronze'),
    (13006, 2, 4, 4, 'Gold'),
    -- Enforcer
    (13007, 1, 2, 10, 'Bronze'),
    (13007, 2, 4, 10, 'Silver'),
    (13007, 3, 6, 10, 'Gold'),
	(13007, 4, 8, 10, 'Gold'),
	(13007, 5, 10, 10, 'Prismatic'),
    -- Experiment
    (13008, 1, 3, 7, 'Bronze'),
    (13008, 2, 5, 7, 'Silver'),
    (13008, 3, 7, 7, 'Gold'),
    -- Family
    (13009, 1, 3, 5, 'Bronze'),
    (13009, 2, 4, 5, 'Silver'),
    (13009, 3, 5, 5, 'Gold'),
    -- Firelight
    (13010, 1, 2, 4, 'Bronze'),
    (13010, 2, 3, 4, 'Silver'),
    (13010, 3, 4, 4, 'Gold'),
    -- Junker King
    (13011, 1, 1, 1, 'Unique'),
    -- Rebel
    (13012, 1, 3, 10, 'Bronze'),
    (13012, 2, 5, 10, 'Silver'),
    (13012, 3, 7, 10, 'Gold'),
	(13012, 4, 10, 10, 'Prismatic'),
    -- Scrap
    (13013, 1, 2, 9, 'Bronze'),
    (13013, 2, 4, 9, 'Silver'),
    (13013, 3, 6, 9, 'Gold'),
	(13013, 4, 9, 9, 'Prismatic'),
    -- Ambusher
    (13014, 1, 2, 5, 'Bronze'),
    (13014, 2, 3, 5, 'Silver'),
    (13014, 3, 4, 5, 'Gold'),
	(13014, 4, 5, 5, 'Prismatic'),
    -- Artillerist
    (13015, 1, 2, 6, 'Bronze'),
    (13015, 2, 4, 6, 'Silver'),
    (13015, 3, 6, 6, 'Gold'),
    -- Bruiser
    (13016, 1, 2, 6, 'Bronze'),
    (13016, 2, 4, 6, 'Silver'),
    (13016, 3, 6, 6, 'Gold'),
    -- Dominator
    (13017, 1, 2, 6, 'Bronze'),
    (13017, 2, 4, 6, 'Silver'),
    (13017, 3, 6, 6, 'Gold'),
    -- Form Swapper
    (13018, 1, 2, 4, 'Bronze'),
    (13018, 2, 4, 4, 'Gold'),
    -- Pit Fighter
    (13019, 1, 2, 8, 'Bronze'),
    (13019, 2, 4, 8, 'Silver'),
    (13019, 3, 6, 8, 'Gold'),
	(13019, 4, 8, 8, 'Gold'),
    -- Quickstriker
    (13020, 1, 2, 4, 'Bronze'),
    (13020, 2, 3, 4, 'Silver'),
    (13020, 3, 4, 4, 'Gold'),
    -- Sentinel
    (13021, 1, 2, 6, 'Bronze'),
    (13021, 2, 4, 6, 'Silver'),
    (13021, 3, 6, 6, 'Gold'),
    -- Sniper
    (13022, 1, 2, 6, 'Bronze'),
    (13022, 2, 4, 6, 'Silver'),
    (13022, 3, 6, 6, 'Gold'),
    -- Sorcerer
    (13023, 1, 2, 8, 'Bronze'),
    (13023, 2, 4, 8, 'Silver'),
    (13023, 3, 6, 8, 'Gold'),
	(13023, 4, 8, 8, 'Gold'),
    -- Visionary
    (13024, 1, 2, 8 ,'Bronze'),
    (13024, 2, 4, 8, 'Silver'),
    (13024, 3, 6, 8, 'Gold'),
	(13024, 4, 6, 8, 'Gold'),
    -- Watcher
    (13025, 1, 2, 6, 'Bronze'),
    (13025, 2, 4, 6, 'Silver'),
    (13025, 3, 6, 6, 'Gold'),
    -- Blood Hunter
    (13026, 1, 1, 1, 'Unique'),
    -- Machine Herald
    (13027, 1, 1, 1, 'Unique'),
    -- Banished Mage
    (13028, 1, 1, 1, 'Unique');
    