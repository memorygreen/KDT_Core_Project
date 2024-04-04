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
prod_sold_dt   TIMESTAMP		DEFAULT  NULL , 			
prod_img_path  VARCHAR(1500)     NOT NULL,
prod_abs_img_path  VARCHAR(1500) NULL,
prod_status    VARCHAR(50)      NOT NULL	DEFAULT '판매중',
PRIMARY KEY (prod_idx)
);
DROP TABLE tb_product;





INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('상품명' ,'제품설명', 9999, 'testid', 'test', '외부경로')


SELECT * FROM tb_product; 
SELECT * FROM tb_user; 

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('남자 맨투맨 팔아요' ,'남자 옷 곰돌이 맨투맨 상태 상급입니다~', 35000, 'mtmbear0824', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%EB%82%A8%EC%9E%90+%EB%A7%A8%ED%88%AC%EB%A7%A8131.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('톰브라운 상의 가격제시' ,'톰브라운 옷 정품입니다. 1번 입고 저랑 안어울려서 올려요', 000000, 'tomman1225', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%EB%82%A8%EC%9E%90+%EC%98%B790.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('정체모를 노트북 팜' ,'아빠가 쓰던 제품 급처해요 사진처럼 사용감 있습니다.', 200000, 'dadnotebook0324', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%EB%85%B8%ED%8A%B8%EB%B6%8113.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('맥북 상태 상급' ,'애플 맥북 노트북 팔아요 영화 볼 때만 써서 기스,찍힘 없습니다.', 450000, 'macArtur1993', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%EB%85%B8%ED%8A%B8%EB%B6%8162.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('스투시 점퍼' ,'제목 그대로임 옷 하자부분 주머니 구멍 조금 뚫림', 70000, 'stussysir0516', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%EC%8A%A4%ED%88%AC%EC%8B%9C%EC%A0%90%ED%8D%BC72.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('아이돌 포토카드 사실 분~' ,'남동생 포카 몰래 팔아요 빨리 사가세요!', 5000, 'idolgirl0119', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%EC%95%84%EC%9D%B4%EB%8F%8C+%ED%8F%AC%EC%B9%B47.jpg')	
		
INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('아이폰15 사실 분' ,'애플 아이폰 15 정품 배터리상태 87% 갤럭시로 기변해서 팔아요ㅎㅎ', 870000, 'iphone1515', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%EC%95%84%EC%9D%B4%ED%8F%B021.jpg')
		
INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('아이폰 퍼플 128기가 팔아여' ,'보라색이 저랑 안어울려서 팔아여 보라색 폰 좋아하시는 분~', 750000, 'applepurple071213', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%EC%95%84%EC%9D%B4%ED%8F%B033.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('아이폰 ~ 은 아니고 케이스 팔아요!' ,'아이폰 케이스 핑크색 팔아요 질감 매트하고 거의 사용감 없이 깨끗해요!', 10000, 'caseBYcase', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%EC%95%84%EC%9D%B4%ED%8F%B098.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('애플폰 아이폰 급처 15프로' ,'색상 실버, 용량 128기가, 배터리상태 83프로, 찍힘 전혀없음', 812300, 'SteveJobs2018', 'test', '외부경로')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('애플 워치 여자 사이즈 40mm' ,'애플워치 이제 더이상 사용안해서 팔아요 3개월 썼어요 상태 좋습니다.', 180000, 'finapplewatch080623', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%EC%95%84%EC%9D%B4%ED%8F%B099.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('애플워치 남자45mm 스트랩까지 드려요' ,'학교에서 몰래 웹툰보기 좋아요 스트랩2개 더 드립니다.', 200000, 'schoolwtf0303', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%EC%95%A0%ED%94%8C%EC%9B%8C%EC%B9%9814.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('에어팟 정품이요' ,'에어팟 몸통은 없고 콩나물만 있어요 싸게 팝니다.', 72500, 'BeanSprouts0512', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%EC%97%90%EC%96%B4%ED%8C%9F18.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('애플 에어팟 세트 팜farm' ,'에어팟 저랑 안맞아서 farmfarm 상태 상입니다.', 180000, 'airrrrr0417', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%EC%97%90%EC%96%B4%ED%8C%9F30.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('구찌 여자 옷이에요!ㅎㅎ' ,'구찌정품이구 제가 입고 사진만 찍고 다시 넣어뒀어요! 완!전! 깨끗합니당!', 355000, 'guccigang123', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%EC%97%AC%EC%84%B1+%EC%98%B7217.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('셔츠 사실분 계신가요ㅎㅎ' ,'여자 셔츠이고 입었을때 니트도 같이 입은 느낌 나요! 봄에 입고 안입어서 팔아요!', 20000, 'shirtGirl0301', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%EC%97%AC%EC%9E%90+%EC%83%81%EC%9D%9839.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('14k 반지 살 사람~' ,'반지 호수 9호 원가 350000원이에요! ', 190000, 'QueenOfTheRings', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%EC%A3%BC%EC%96%BC%EB%A6%AC117.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('유행중인 스탠리 텀블러 팔아요!' ,'선물 받은 건데 한 번도 사용안했구 사진때문에 개봉 한 번 했습니다!', 38000, 'staaaanley0508', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%ED%85%80%EB%B8%94%EB%9F%AC207.jpg')
	
INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('텀블러 팔아요~ 스탠리 베이지' ,'팔려구 소독까지 했습니다 스탠리 워낙 유명해서 따로 설명은 안할게요 찍힘/기스없어요ㅎ', 30000, 'hagismagic0329', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%ED%85%80%EB%B8%94%EB%9F%AC212.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('여자 핸드백 팔아용 체인포함 입니당' ,'원가 150000원인데 제가 쓰다가 파는 거라 싸게 팔게용', 65000, 'handbagchain0701', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%ED%8C%A8%EC%85%98%EC%9E%A1%ED%99%94136.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('핸드백 보세 제품이에요!' ,'택배 배송 받구 2번 쓰고 안써서 팔아요! 상태는 깨끗합니당', 25000, 'baghand0625', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%ED%8C%A8%EC%85%98%EC%9E%A1%ED%99%9482.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('소니 헤드셋 팔아요~' ,'베이지색이고 케이스랑 케이블은 잃어버려서 없어요 충전은 c타입입니다', 250000, 'sony0814', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%ED%97%A4%EB%93%9C%EC%85%8B106.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('소니 블랙색상 헤드셋 급처' ,'돈이 없어서 급하게 팔아요 헤드셋 사용 거의 안해서 상태는 괜찮구요 패키지 전부 드려요', 300000, 'blackson0206', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%ED%97%A4%EB%93%9C%EC%85%8B113.jpg')

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
		VALUES ('헤드셋 팔아요! 소니제품 정품입니당' ,'소니 정품 헤드셋이구 베이지색에 한 번 착용 후 안써서 팔아용! 내용물 전부 포함이에요!', 420000, 'Queensony0317', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%ED%97%A4%EB%93%9C%EC%85%8B130.jpg')		
		
		
-- prod_idx 11번 지우기
DELETE FROM tb_product WHERE prod_idx=11;

INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_img_path, prod_abs_img_path) 
VALUES ('애플폰 아이폰 급처 15프로' ,'색상 실버, 용량 128기가, 배터리상태 83프로, 찍힘 전혀없음', 812300, 'SteveJobs2018', 'test', 'https://duckgeun.s3.ap-northeast-2.amazonaws.com/ppap/%EA%B1%B0%EB%A5%B8+%EC%82%AC%EC%A7%84/%EC%95%84%EC%9D%B4%ED%8F%B099.jpg')
SELECT * FROM tb_product; 

		
		




-- 상품 게시글 별 댓글 개수 확인용
SELECT p.*, COUNT(r.reply_idx) AS reply_count
        FROM tb_product p
        LEFT JOIN tb_reply r ON p.prod_idx = r.prod_idx
        GROUP BY p.prod_idx
        ORDER BY reply_count DESC , prod_name;
        
        
        
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

SELECT * FROM tb_product; 

DROP TABLE tb_product;

COMMIT;

-- IDX 자동생성되는지 확인
INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_views, prod_rpt_cnt, created_at, prod_sold_dt, prod_img_path, prod_status) 
VALUES ('테스트용제품명' ,'테스트용 제품설명 입니다.', 123456, 'testID', 0,0, NOW(), '2024-03-25', '임시경로', '활동중(임시)')

-- DEFAULT값 잘 들어가는지 확인(조회수, 신고수, 등록일시, 판매상태) 
INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_sold_dt, prod_img_path) 
		VALUES ('테스트용제품명' ,'테스트용 제품설명 입니다.', 123456, 'testID', '2024-03-25', '임시경로')

-- tb_product 테이블 확인
SELECT * FROM tb_product;

-- tb_user 테이블 확인
SELECT * FROM tb_user;


-- 상품 임시데이터 생성(jyk)
INSERT INTO tb_product (prod_name, prod_desc, prod_price, seller_id, prod_sold_dt, prod_img_path) 
		VALUES ('테스트용제품명2222' ,'테스트용 제품설명 입니다2222.', 222222, 'jyk', NOW()+1, '임시경로222')


-- 상품 임시데이터 생성
INSERT INTO tb_product (prod_idx, prod_name, prod_desc, prod_price, seller_id, prod_views, prod_rpt_cnt, created_at, prod_sold_dt, prod_img_path, prod_status) 
VALUES (1, '테스트용제품명' ,'테스트용 제품설명 입니다.', 123456, 'testID', 0,0, '2024-03-25', '2024-03-25', '임시경로', '활동중(임시)')

INSERT INTO tb_product (prod_idx, prod_name, prod_desc, prod_price, seller_id, prod_views, prod_rpt_cnt, created_at, prod_sold_dt, prod_img_path, prod_status) 
VALUES (2, '테스트용222가방' ,'테스트용 제품설명 입니다.', 2222222, 'test2', 0,0, '2024-03-25', '2024-03-25', '임시경로', '활동중(임시)')

-- 관리자
INSERT INTO tb_user (user_id, user_pw, user_phone, user_birthdate, user_role) 
		VALUES ('ASD', 1234, '010-1111-1111', '1999-09-09', 'A');


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