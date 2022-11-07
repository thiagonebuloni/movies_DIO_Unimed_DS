# movies_DIO_Unimed_DS

Criação de um banco de dadosem MySQL para implementação dos conhecimentos do curso.
Banco de dados movies contém as seguintes tabelas:
- directors
- movies
- people
- ratings
- stars

___

## Queries de exemplo:


### liste os títulos do smovies lançados em 2008

`SELECT title FROM movies WHERE year = 2008;`


### liste o ano de nascimento de Emma Stone

`SELECT birth FROM people WHERE name = 'Emma Stone';`


### liste os números dos filmes com nota 10.0

`SELECT COUNT(ratings.rating) FROM ratings WHERE rating = 10.0;`


### liste of títulos e anos de lançamento dos todos os filmes do Harry Potter, ordenados cronológicamente

`SELECT title, year FROM movies WHERE title LIKE 'Harry Potter%' ORDER BY year ASC;`


### liste a média das notas de filmes do ano de 2012

`SELECT AVG(ratings.rating) FROM ratings JOIN movies ON ratings.movie_id = movies.id WHERE year = 2012;`


### liste os títulos de cada filme em que Johnny Depp e Helena Bonham Carter estrelaram juntos

`SELECT movies.title FROM movies
JOIN stars ON movies.id = stars.movie_id
JOIN people ON stars.person_id = people.id
WHERE people.name IN ("Johnny Depp", "Helena Bonham Carter")
GROUP BY movies.title
HAVING COUNT(movies.id) > 1;`


### liste o nome de todas as pessoas que atuaram em Toy Story, gerando apenas uma coluna com o nome de cada pessoa

`SELECT people.name FROM people JOIN stars ON people.id = stars.person_id WHERE stars.movie_id = (SELECT movies.id FROM movies JOIN stars ON stars.movie_id = movies.id WHERE movies.title = "Toy Story");`


### liste os nomes das pessoas que estrelaram um filme em 2004, ordenadas por data de nascimento. resultados únicos por nome.

`SELECT DISTINCT people.name FROM people JOIN stars ON people.id = stars.person_id JOIN movies ON stars.movie_id = movies.id WHERE movies.year = 2004 ORDER BY people.birth ASC;`


### liste os nomes de cada pessoa que dirigiu um filme com nota igual ou maior à 9

`SELECT DISTINCT people.name FROM people JOIN directors ON people.id = directors.person_id JOIN movies ON movies.id = directors.movie_id JOIN ratings ON ratings.movie_id = movies.id WHERE ratings.rating >= 9.0;`


### liste os títulos dos 5 filmes estrelados por Chadwick Boseman com as melhores notas, em ordem descrescente.

`SELECT movies.title FROM movies JOIN ratings ON ratings.movie_id = movies.id JOIN stars ON stars.movie_id = movies.id JOIN people ON people.id = stars.person_id WHERE people.name = "Chadwick Boseman" ORDER BY ratings.rating DESC LIMIT 5;`


### liste os nomes das pessoas que estrelaram um filme com Kevin Bacon

`SELECT DISTINCT people.name FROM people
JOIN stars ON people.id = stars.person_id
WHERE stars.movie_id IN
(SELECT stars.movie_id FROM stars
JOIN people ON people.id = stars.person_id
WHERE people.name = "Kevin Bacon"
AND people.birth = 1958)
AND people.name != "Kevin Bacon";`


### liste os nomes das pessoas que estrelaram um filme com Kevin Bacon e nasceram em 1958

`SELECT DISTINCT people.name FROM people
JOIN stars ON people.id = stars.person_id
WHERE stars.movie_id IN
(SELECT stars.movie_id FROM stars
JOIN people ON people.id = stars.person_id
WHERE people.name = "Kevin Bacon"
AND people.birth = 1958)
AND people.name != "Kevin Bacon";`
