
--첨부파일을 위한 테이블 추가

--TBL_ATTACH 
--필수요소
--물리적파일이름(UUID), 원본파일이름, 경로, 글번호(어디에첨부되냐), 이미지여부, 순서
-- 문자(UUID+확장자):50,  문자:500  , 문자:10,    숫자             , 불린(문자):1, 숫자  >>논리스키마 정의 완료

CREATE TABLE TBL_ATTACH (
    UUID VARCHAR2(50) CONSTRAINT PK_ATTACH PRIMARY KEY,
    ORIGIN VARCHAR(500) NOT NULL,
    PATH CHAR(10),
    IMAGE CHAR(1) DEFAULT '0', --기본값은 이미지가 아닌 상태
    ORD NUMBER DEFAULT 1,
    BNO CONSTRAINT FK_ATTACH_BNO REFERENCES TBL_BOARD(BNO) 
    --글번호 외래키라 제일뒤로
);

DROP TABLE TBL_ATTACH;

--첨부파일 조회

--목록조회 (카테고리처럼)
SELECT * FROM TBL_ATTACH WHERE BNO = 1; --인덱스경로가 최적화로 안뜸
--상세조회 
SELECT * FROM TBL_ATTACH WHERE UUID = 1; 

--UUID BNO 묶어서 인덱스 생성
CREATE UNIQUE INDEX IDX_ATTACH_UUID_BNO ON TBL_ATTACH(UUID, BNO DESC);

--힌트 사용해서 최적화 경로 직접지정
SELECT /*+ INDEX(TBL_ATTACH IDX_ATTACH_UUID_BNO) */ * FROM TBL_ATTACH WHERE BNO = 1;

SELECT * FROM tbl_board ORDER BY BNO DESC;

SELECT * FROM tbl_attach;

DELETE TBL_BOARD WHERE BNO = 284;

--pk, FK FK INDEX
ALTER TABLE TBL_REPLY ADD CONSTRAINT PK_REPLY PRIMARY KEY(RNO);  --테이블레벨지정
ALTER TABLE TBL_REPLY MODIFY(BNO CONSTRAINT FK_REPLY_BNO REFERENCES TBL_BOARD(BNO)); --COLUMN LEVEL 
ALTER TABLE TBL_REPLY ADD CONSTRAINT FK_REPLY_WRITER FOREIGN KEY(WRITER) REFERENCES TBL_MEMBER(ID); --TABLE LEVEL

-- RNO, BNO 묶어서 INDEX 생성
CREATE UNIQUE INDEX IDX_REPLY_RNO_BNO ON TBL_REPLY(RNO, BNO DESC);


--조회쿼리



--등록쿼리

SELECT * FROM tbl_reply;
DELETE TBL_REPLY WHERE RNO = 52;


--220324



