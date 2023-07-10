
-- 지점(S2store) 테이블 생성
CREATE TABLE S2_STORE (
	store NUMBER PRIMARY KEY,
	store_name varchar2(50) NOT NULL,
	store_address varchar2(100) NOT NULL,
	store_phone varchar2(20) NOT NULL
	
);
SELECT * FROM S2_STORE;

-- 지점 DB 추가
INSERT INTO S2_STORE VALUES (1001, '제주 오토하우스1', '제주시 용해로 92', '0642873681');
INSERT INTO S2_STORE VALUES (1002, '제주 오토하우스2', '제주시 용해로 129-1', '0649875254');
INSERT INTO S2_STORE VALUES (1003, '제주 오토하우스3', '제주시 애월읍 천덕로 880-24', '0643858956');
SELECT * FROM S2_STORE;

-- 차량모델(S2model) 테이블 생성
CREATE TABLE S2_MODEL (
	model varchar2(50)PRIMARY KEY,
	brand varchar2(50),
	kind varchar2(50) NOT NULL,
	expense number NOT NULL
);
SELECT * FROM S2_MODEL;

-- 차량모델 DB 추가
INSERT INTO S2_MODEL VALUES ('소나타', '현대', '중형', 40000);
INSERT INTO S2_MODEL VALUES ('아반떼', '현대', '중형', 40000);

-- 보유차량(S2car) 테이블 생성
CREATE TABLE S2_CAR (
	car_number NUMBER PRIMARY KEY,
	distance_driven NUMBER NOT null,
	car_plate varchar2(50) NOT NULL,
	store NUMBER,
	model varchar2(50),
	FOREIGN KEY (store) REFERENCES S2_STORE(store),
	FOREIGN KEY (model) REFERENCES S2_MODEL(model)
	ON DELETE CASCADE
);

-- 보유차량 DB 추가
INSERT INTO S2_CAR VALUES (100104, 100000, '132허 6041', 1001, '소나타');
INSERT INTO S2_CAR VALUES (100105, 10293, '21호 1209', 1001, '아반떼');
SELECT * FROM s2_car;


-- 부모 자식 가져오는지 확인
SELECT S2_CAR.car_number, S2_CAR.distance_driven, S2_CAR.car_plate, S2_CAR.store, S2_CAR.model
FROM S2_CAR
JOIN S2_STORE ON S2_CAR.store = S2_STORE.store
JOIN S2_MODEL ON S2_CAR.model = S2_MODEL.model;

-- 무결성 제약 조건 확인
select
    constraint_name,
    table_name,
    r_constraint_name
from
    user_constraints
where
    constraint_name = 'SYS_C007239';

   DROP TABLE S2_CAR;
   DROP TABLE S2_STORE;
   DROP TABLE S2_MODEL;

SELECT car_number  FROM S2_CAR sc;
