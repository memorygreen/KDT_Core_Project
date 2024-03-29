--tb_user 테이블 생성
CREATE TABLE tb_product (
prod_idx INT UNSIGNED   AUTO_INCREMENT  NOT NULL,  --양수, 자동으로 채워지게
prod_name      VARCHAR(150)     NOT NULL,
prod_desc      TEXT             NOT NULL,
prod_price     INT UNSIGNED     NOT NULL, -- 양수
seller_id      VARCHAR(30)      NOT NULL,
prod_views     INT UNSIGNED     NOT NULL	DEFAULT 0, -- 양수 기본값 0
prod_rpt_cnt   INT UNSIGNED     NOT NULL	DEFAULT 0 , --기본값 0
created_at     TIMESTAMP        NOT NULL	DEFAULT NOW(), -- 기본값 오늘 날짜 now()
prod_sold_dt   TIMESTAMP, 					-- 기본값을 null로 하면 에러가 나겠지?
prod_img_path  VARCHAR(1500)    NOT NULL,  --사진 필수로 입력하려면 not null
prod_status    VARCHAR(50)      NOT NULL	DEFAULT '판매중', --기본은 판매중으로 해야하나?
 PRIMARY KEY (prod_idx)
);
  
-- 위 생성문 그대로 복사(주석만 삭제함)
CREATE TABLE tb_product (
prod_idx INT UNSIGNED   AUTO_INCREMENT  NOT NULL,
prod_name      VARCHAR(150)     NOT NULL,
prod_desc      TEXT             NOT NULL,
prod_price     INT UNSIGNED     NOT NULL,
seller_id      VARCHAR(30)      NOT NULL,
prod_views     INT UNSIGNED     NOT NULL	DEFAULT 0, 
prod_rpt_cnt   INT UNSIGNED     NOT NULL	DEFAULT 0 , 
created_at     TIMESTAMP        NOT NULL	DEFAULT NOW(), 
prod_sold_dt   TIMESTAMP, 					
prod_img_path  VARCHAR(1500)    NOT NULL,
prod_status    VARCHAR(50)      NOT NULL	DEFAULT '판매중',
PRIMARY KEY (prod_idx)
);


DROP TABLE tb_reply;
--tb_reply 테이블 생성
CREATE TABLE tb_reply(
	reply_idx INT UNSIGNED   AUTO_INCREMENT  PRIMARY KEY, 
	reply_content VARCHAR(500) NOT NULL, 
	replied_at TIMESTAMP NOT NULL DEFAULT NOW(),
	prod_idx INT NOT NULL, 
	reply_writer_id VARCHAR(30) NOT NULL
);

SELECT * FROM tb_reply; 

DROP TABLE tb_product;

COMMIT;

-- IDX 자동생성되는지 확인
INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_views, prod_rpt_cnt, created_at, prod_sold_dt, prod_img_path, prod_status) 
VALUES ('테스트용제품명' ,'테스트용 제품설명 입니다.', 123456, 'testID', 0,0, NOW(), '2024-03-25', '임시경로', '활동중(임시)')

-- DEFAULT값 잘 들어가는지 확인(조회수, 신고수, 등록일시, 판매상태) 
INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_sold_dt, prod_img_path) 
		VALUES ('테스트용제품명' ,'테스트용 제품설명 입니다.', 123456, 'testID', '2024-03-25', '임시경로')

-- tb_user 테이블 확인
SELECT * FROM tb_product;


-- 상품 임시데이터 생성(jyk)
INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_sold_dt, prod_img_path) 
		VALUES ('테스트용제품명2222' ,'테스트용 제품설명 입니다2222.', 222222, 'jyk', NOW()+1, '임시경로222')


-- 상품 임시데이터 생성
INSERT INTO tb_product (prod_idx, prod_name, prod_desc, prod_price, seller_id, prod_views, prod_rpt_cnt, created_at, prod_sold_dt, prod_img_path, prod_status) 
VALUES (1, '테스트용제품명' ,'테스트용 제품설명 입니다.', 123456, 'testID', 0,0, '2024-03-25', '2024-03-25', '임시경로', '활동중(임시)')

INSERT INTO tb_product (prod_idx, prod_name, prod_desc, prod_price, seller_id, prod_views, prod_rpt_cnt, created_at, prod_sold_dt, prod_img_path, prod_status) 
VALUES (2, '테스트용222가방' ,'테스트용 제품설명 입니다.', 2222222, 'test2', 0,0, '2024-03-25', '2024-03-25', '임시경로', '활동중(임시)')




DELETE FROM REPLY;
DELETE FROM BOARD;

DROP TABLE BOARD;

CREATE TABLE BOARD(
	IDX INT NOT NULL AUTO_INCREMENT,
	TITLE VARCHAR(100) NOT NULL,
	CONTENT VARCHAR(2000) NOT NULL,
	WRITER VARCHAR(30) NOT NULL,
	INDATE DATETIME DEFAULT NOW(),
	COUNT INT DEFAULT 0,
	IMGPATH VARCHAR(200),
	PRIMARY KEY(IDX)
);


SELECT * FROM BOARD;



INSERT INTO BOARD (TITLE, CONTENT, WRITER)
VALUES('봄이 왔나봐요 날이 따뜻해집니다.', '하지만 외롭죠...', '장범준');
INSERT INTO BOARD (TITLE, CONTENT, WRITER)
VALUES('해뜨는집 미친 메뉴 오늘 알아옴', '묵은지고등어조림 진짜 완전 꿀맛', '김가가');
INSERT INTO BOARD (TITLE, CONTENT, WRITER)
VALUES('엊그제만 하더라도 기본자료형 배웠는데', '벌써 스프링이라니 세상빠르다', '최나나');
INSERT INTO BOARD (TITLE, CONTENT, WRITER)
VALUES('호두아빠 구독 좋아요 부탁드립니다', '400명 유튜버 가자!!', '강다다');
INSERT INTO BOARD (TITLE, CONTENT, WRITER)
VALUES('안녕하세요 박라라입니다!', '라라라라', '박라라');


SELECT * FROM BOARD;

CREATE TABLE REPLY(
   IDX INT NOT NULL AUTO_INCREMENT,
   BOARDNUM INT NOT NULL,
   WRITER VARCHAR(30) NOT NULL,
   CONTENT VARCHAR(2000) NOT NULL,
   INDATE DATETIME DEFAULT NOW(),
   PRIMARY KEY(IDX)
);

DROP TABLE REPLY;

SELECT * FROM REPLY; 


CREATE TABLE MEMBER(
	ID VARCHAR(100) NOT NULL,
	PW VARCHAR(100) NOT NULL,
	NICK VARCHAR(100) NOT NULL,
	PRIMARY KEY(ID)
);

SELECT * FROM MEMBER; 