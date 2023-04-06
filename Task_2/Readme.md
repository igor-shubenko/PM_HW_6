### Завдання 2
Запити на створення таблиць - init_database.sql

Запити на наповнення таблиць - fill_database.sql

**Запит на отримання найактивніших користувачів**

```shell
SELECT
	EXTRACT (YEAR FROM date_created) AS "year",
	EXTRACT (MONTH FROM date_created) AS "month",
	users.name AS name,
	users.last_name AS last_name,
	COUNT(bets.state) AS bets_amount,
	SUM(bet_amount) AS bets_sum, 
	(COUNT(bets.state) FILTER (WHERE bets.state = 'won'))* 100 / COUNT(bets.state) AS won_percent,
	(COUNT(bets.state) FILTER (WHERE bets.state = 'lose'))* 100 / COUNT(bets.state) AS lose_percent,
	SUM(CASE
			WHEN market = 'team_1' AND bets.state = 'won' THEN team_1_koef * bets.bet_amount
			WHEN market = 'team_2' AND bets.state = 'won' THEN team_2_koef * bets.bet_amount
			WHEN market = 'draw' AND bets.state = 'won' THEN draw_koef * bets.bet_amount
			ELSE 0
			END) AS wons_sum
FROM
	bets
JOIN users ON
	bets.userid = users.id
JOIN events ON
	bets.eventid = events.id
GROUP BY
	"year",
	"month",
	bets.userid,
	users.name,
	users.last_name
ORDER BY
	"year" DESC,
	"month" DESC,
	bets_amount DESC;
```