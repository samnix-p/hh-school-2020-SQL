CREATE TABLE employer (
    employer_id      serial primary key,
    employer_name    text not null,
    area_id          integer not null
);

CREATE TABLE vacancy (
    vacancy_id            serial primary key,
    employer_id           integer not null references employer(employer_id),
    position_name         text not null,
    compensation_from     integer,
    compensation_to       integer,
    compensation_gross    boolean,
    creation_date         date default now()
);

CREATE TABLE application (
    application_id    serial primary key,
    vacancy_id        integer not null references vacancy(vacancy_id),
    creation_date     date default now()
);

INSERT INTO employer (employer_name, area_id)
VALUES ('hh.ru', 1),
       ('Яндекс', 1),
       ('Рога и Копыта', 2),
       ('Иванов и КО', 2),
       ('Google', 3),
       ('Bayer', 3),
       ('Интеграл', 2),
       ('Сбербанк', 1),
       ('Сайты для вас', 2),
       ('Быстро и Дешево', 1),
       ('Логистик', 1),
       ('Музыка для души', 3);
       
INSERT INTO vacancy (employer_id, position_name, compensation_from, compensation_to, compensation_gross, creation_date)
VALUES (1, 'Разработчик', 20000, 30000, true, '2017-12-28'),
       (1, 'Продавец', 18000, 38000, true, '2019-03-01'),
       (1, 'Продавец', 19000, 32000, false, '2020-01-01'),
       (1, 'Продавец', 13000, 30000, false, '2019-04-07'),
       (10, 'Продавец', 12500, 18800, true, '2019-04-15'),
       (1, 'Музыкант', null, null, false, '2018-07-20'),
       (1, 'Музыкант', 20000, null, false, '2019-05-23'),
       (7, 'Музыкант', null, null, false, '2018-02-17'),
       (6, 'Музыкант', null, 50200, true, '2017-03-12'),
       (1, 'Музыкант', 13200, 75000, false, '2020-01-14'),
       (1, 'Прораб', 5000, 55000, false, '2019-01-15'),
       (1, 'Прораб', 10200, 17500, true, '2019-07-23'),
       (1, 'Прораб', null, 31000, false, '2019-04-21'),
       (1, 'Прораб', 29000, null, false, '2019-06-17'),
       (2, 'Аналитик', 15000, 17000, false, '2019-02-04'),
       (2, 'Аналитик', 42000, 42000, false, '2019-07-08'),
       (8, 'Тестировщик', 10000, 20000, true, '2019-10-30'),
       (8, 'Тестировщик', 10000, 20000, true, '2018-10-30'),
       (2, 'Писатель', null, null, true, '2019-08-09'),
       (2, 'Кассир', 10000, 15000, false, '2018-11-21'),
       (2, 'Уборщик', 15000, 17000, false, '2019-01-14'),
       (9, 'Бухгалтер', 10000, 15000, false, '2018-02-14'),
       (3, 'Бариста', 18000, 21000, false, '2019-03-17'),
       (3, 'Схемотехник', null, 17000, true, '2019-12-24'),
       (4, 'Проектировщик', 10000, null, false, '2019-05-04'),
       (10, 'Продюсер', 50000, 53000, true, '2020-01-28'),
       (4, 'Менеджер', null, null, true, '2019-01-05'),
       (5, 'Инженер', 10000, 15000, true, '2019-02-20'),
       (5, 'Тестировщик', 10000, 15000, false, '2020-02-20'),
       (5, 'Бухгалтер', 20000, 30000, false, '2017-01-21');

INSERT INTO application (vacancy_id, creation_date)
VALUES (15, '2019-02-04'),
       (15, '2019-05-02'),
       (15, '2019-08-22'),
       (2, '2019-05-05'),
       (2, '2019-05-06'),
       (3, '2020-01-07'),
       (3, '2020-01-09'),
       (1, '2017-12-30'),
       (1, '2018-05-05'),
       (1, '2018-07-30'),
       (23, '2019-03-25'),
       (24, '2020-03-20'),
       (25, '2019-08-20'),
       (25, '2019-10-17'),
       (25, '2019-09-23');
