
INSERT INTO konferencija (id_konf, naz_konf, tema_konf, opis_konf, dat_pocetak, dat_kraj, maxbr_pred_konf, maxbr_uces_konf)
VALUES (1, 'Konferencija A', 'Tema A', 'Opis konferencije A', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-03', 'YYYY-MM-DD'), 50, 200);

INSERT INTO organizator (id_org, naz_org, email_org, br_tel_org)
VALUES (1, 'Organizacija A', 'orgA@example.com', 987654321);


INSERT INTO konferencija (id_konf, naz_konf, tema_konf, opis_konf, dat_pocetak, dat_kraj, maxbr_pred_konf, maxbr_uces_konf)
VALUES (2, 'Konferencija B', 'Tema B', 'Opis konferencije B', TO_DATE('2024-02-15', 'YYYY-MM-DD'), TO_DATE('2024-02-18', 'YYYY-MM-DD'), 40, 150);

INSERT INTO konferencija (id_konf, naz_konf, tema_konf, opis_konf, dat_pocetak, dat_kraj, maxbr_pred_konf, maxbr_uces_konf)
VALUES (3, 'Konferencija C', 'Tema C', 'Opis konferencije C', TO_DATE('2024-03-20', 'YYYY-MM-DD'), TO_DATE('2024-03-22', 'YYYY-MM-DD'), 60, 180);

INSERT INTO konferencija (id_konf, naz_konf, tema_konf, opis_konf, dat_pocetak, dat_kraj, maxbr_pred_konf, maxbr_uces_konf)
VALUES (4, 'Konferencija D', 'Tema D', 'Opis konferencije D', TO_DATE('2024-04-10', 'YYYY-MM-DD'), TO_DATE('2024-04-12', 'YYYY-MM-DD'), 45, 160);

INSERT INTO konferencija (id_konf, naz_konf, tema_konf, opis_konf, dat_pocetak, dat_kraj, maxbr_pred_konf, maxbr_uces_konf)
VALUES (5, 'Konferencija E', 'Tema E', 'Opis konferencije E', TO_DATE('2024-05-05', 'YYYY-MM-DD'), TO_DATE('2024-05-07', 'YYYY-MM-DD'), 55, 190);

INSERT INTO konferencija (id_konf, naz_konf, tema_konf, opis_konf, dat_pocetak, dat_kraj, maxbr_pred_konf, maxbr_uces_konf)
VALUES (6, 'Konferencija F', 'Tema F', 'Opis konferencije F', TO_DATE('2024-06-15', 'YYYY-MM-DD'), TO_DATE('2024-06-18', 'YYYY-MM-DD'), 30, 120);


INSERT INTO organizator (id_org, naz_org, email_org, br_tel_org)
VALUES (2, 'Organizacija B', 'orgB@example.com', 876543210);

INSERT INTO organizator (id_org, naz_org, email_org, br_tel_org)
VALUES (3, 'Organizacija C', 'orgC@example.com', 654321098);

INSERT INTO organizator (id_org, naz_org, email_org, br_tel_org)
VALUES (4, 'Organizacija D', 'orgD@example.com', 432109876);

INSERT INTO organizator (id_org, naz_org, email_org, br_tel_org)
VALUES (5, 'Organizacija E', 'orgE@example.com', 210987654);

INSERT INTO organizator (id_org, naz_org, email_org, br_tel_org)
VALUES (6, 'Organizacija F', 'orgF@example.com', 789012345);


INSERT INTO sponzor (id_sp, naz_sp, email_sp, br_tel_sp)
VALUES (1, 'Sponzor A', 'sponzorA@example.com', 123456789);

INSERT INTO sponzor (id_sp, naz_sp, email_sp, br_tel_sp)
VALUES (2, 'Sponzor B', 'sponzorB@example.com', 987654321);

INSERT INTO sponzor (id_sp, naz_sp, email_sp, br_tel_sp)
VALUES (3, 'Sponzor C', 'sponzorC@example.com', 456789012);

INSERT INTO sponzor (id_sp, naz_sp, email_sp, br_tel_sp)
VALUES (4, 'Sponzor D', 'sponzorD@example.com', 789012345);

INSERT INTO sponzor (id_sp, naz_sp, email_sp, br_tel_sp)
VALUES (5, 'Sponzor E', 'sponzorE@example.com', 234567890);

INSERT INTO sponzorise (konferencija_id_konf, sponzor_id_sp)
VALUES (1, 1);

INSERT INTO sponzorise (konferencija_id_konf, sponzor_id_sp)
VALUES (2, 2);

INSERT INTO sponzorise (konferencija_id_konf, sponzor_id_sp)
VALUES (3, 3);

INSERT INTO sponzorise (konferencija_id_konf, sponzor_id_sp)
VALUES (4, 4);

INSERT INTO sponzorise (konferencija_id_konf, sponzor_id_sp)
VALUES (5, 5);

INSERT INTO organizuje (konferencija_id_konf, organizator_id_org)
VALUES (1, 1);

INSERT INTO organizuje (konferencija_id_konf, organizator_id_org)
VALUES (2, 2);

INSERT INTO organizuje (konferencija_id_konf, organizator_id_org)
VALUES (3, 3);

INSERT INTO organizuje (konferencija_id_konf, organizator_id_org)
VALUES (4, 4);

INSERT INTO organizuje (konferencija_id_konf, organizator_id_org)
VALUES (5, 5);


CREATE VIEW bp1 AS
SELECT
    k.id_konf,
    k.naz_konf,
    s.id_sp,
    s.naz_sp,
    AVG(k.maxbr_pred_konf) AS avg_maxbr_pred_konf
FROM
    konferencija k
LEFT JOIN sponzorise se ON k.id_konf = se.konferencija_id_konf
LEFT JOIN sponzor s ON se.sponzor_id_sp = s.id_sp
GROUP BY k.id_konf, k.naz_konf, s.id_sp, s.naz_sp
ORDER BY avg_maxbr_pred_konf DESC;

CREATE VIEW bp2 AS
SELECT
    k.id_konf,
    k.naz_konf,
    o.id_org,
    o.naz_org,
    SUM(k.maxbr_uces_konf) AS sum_maxbr_uces_konf
FROM
    konferencija k
LEFT JOIN sponzorise se ON k.id_konf = se.konferencija_id_konf
LEFT JOIN sponzor s ON se.sponzor_id_sp = s.id_sp
LEFT JOIN organizuje og ON k.id_konf = og.konferencija_id_konf
LEFT JOIN organizator o ON og.organizator_id_org = o.id_org
GROUP BY k.id_konf, k.naz_konf, o.id_org, o.naz_org
ORDER BY sum_maxbr_uces_konf DESC;