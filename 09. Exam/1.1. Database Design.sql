CREATE TABLE towns (
	id SERIAL PRIMARY KEY,
	name VARCHAR(45) NOT NULL
)
;
 
CREATE TABLE stadiums(
    id SERIAL PRIMARY KEY,
	name VARCHAR(45) NOT NULL,
    capacity int not null,
    town_id int not null
 
    CONSTRAINT ck_stadiums_capacity
    CHECK (capacity > 0),
 
    CONSTRAINT fk_stadiums_towns
    FOREIGN KEY (town_id)
    REFERENCES towns(id)
    ON UPDATE CASCADE
	ON DELETE CASCADE
)
;
 
CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    established date not null,
    fan_base int default 0 not null,
    stadium_id int not null
 
    constraint ck_teams_fan_base
    check (fan_base >= 0),
 
    CONSTRAINT fk_teams_stadiums
    FOREIGN KEY (stadium_id)
    REFERENCES stadiums(id)
    ON UPDATE CASCADE
	ON DELETE CASCADE
)
;
 
 
CREATE TABLE coaches(
    id SERIAL PRIMARY KEY,
	first_name VARCHAR(10) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
    salary numeric(10, 2) default 0 not null,
    coach_level int default 0 not null
 
    CONSTRAINT ck_coaches_salary
    CHECK (salary >= 0)
 
    CONSTRAINT ck_coaches_coach_level
    CHECK (coach_level >= 0)
)
 
;
 
 
CREATE TABLE skills_data(
    id SERIAL PRIMARY KEY,
    dribbling int default 0,
    pace int default 0,
    passing int default 0,
    shooting int default 0,
    speed int default 0,
    strength int default 0
 
    CONSTRAINT ck_skills_data_dribbling
    CHECK (dribbling >= 0),
 
    CONSTRAINT ck_skills_data_pace
    CHECK (pace >= 0),
 
    CONSTRAINT ck_skills_passing
    CHECK (passing >= 0),
 
    CONSTRAINT ck_skills_shooting
    CHECK (shooting >= 0),
 
    CONSTRAINT ck_skills_speed
    CHECK (speed >= 0),
 
    CONSTRAINT ck_skills_strength
    CHECK (strength >= 0)
)
;
 
 
CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(10) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
    age int default 0 not null,
    position CHAR(1) not null,
    salary numeric(10, 2) default 0 not null,
    hire_date TIMESTAMP,
    skills_data_id int not null,
    team_id int
 
    CONSTRAINT ck_players_age
    CHECK (age >= 0),
 
    CONSTRAINT ck_players_salary
    CHECK (salary >= 0),
 
    CONSTRAINT fk_players_skills_data
    FOREIGN KEY (skills_data_id)
    REFERENCES skills_data(id)
    ON UPDATE CASCADE
	ON DELETE CASCADE,
 
    CONSTRAINT fk_players_teams
    FOREIGN KEY (team_id)
    REFERENCES teams(id)
    ON UPDATE CASCADE
	ON DELETE CASCADE
)
;
 
CREATE TABLE players_coaches(
    player_id int,
    coach_id int,
 
    CONSTRAINT fk_players_coaches_players
    FOREIGN KEY(player_id)
    REFERENCES players(id)
    ON UPDATE CASCADE
	ON DELETE CASCADE,
 
    CONSTRAINT fk_players_coaches_coaches
    FOREIGN KEY(coach_id)
    REFERENCES coaches(id)
    ON UPDATE CASCADE
	ON DELETE CASCADE
)
;