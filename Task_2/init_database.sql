CREATE TABLE IF NOT EXISTS Users (
    id serial PRIMARY KEY,
    name text,
    last_name text,
    time_created timestamp,
    balance real,
    gender text,
    age int,
    city text,
    birth_day text,
    premium bool,
    ip text
    );

CREATE TABLE IF NOT EXISTS Events (
    id serial PRIMARY KEY,
    type text,
    name text,
    event_date timestamp,
    score text,
    state text
);

ALTER TABLE IF EXISTS Events
    ADD COLUMN IF NOT EXISTS team_1_koef numeric (6, 2) DEFAULT null,
    ADD COLUMN IF NOT EXISTS team_2_koef numeric (6, 2) DEFAULT null,
    ADD COLUMN IF NOT EXISTS draw_koef numeric (6, 2) DEFAULT null;


CREATE TABLE IF NOT EXISTS Bets (
    id serial PRIMARY KEY,
    date_created timestamp,
    userId int REFERENCES users(id) ON DELETE CASCADE,
    eventId int REFERENCES events(id) ON DELETE CASCADE,
    market text,
    state text
);

ALTER TABLE IF EXISTS Bets
    ADD COLUMN IF NOT EXISTS bet_amount numeric (6, 2) DEFAULT null,
    ADD COLUMN IF NOT EXISTS bet_currency char(3) DEFAULT null;



