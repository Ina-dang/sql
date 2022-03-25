
--÷�������� ���� ���̺� �߰�

--TBL_ATTACH 
--�ʼ����
--�����������̸�(UUID), ���������̸�, ���, �۹�ȣ(���÷�εǳ�), �̹�������, ����
-- ����(UUID+Ȯ����):50,  ����:500  , ����:10,    ����             , �Ҹ�(����):1, ����  >>����Ű�� ���� �Ϸ�

CREATE TABLE TBL_ATTACH (
    UUID VARCHAR2(50) CONSTRAINT PK_ATTACH PRIMARY KEY,
    ORIGIN VARCHAR(500) NOT NULL,
    PATH CHAR(10),
    IMAGE CHAR(1) DEFAULT '0', --�⺻���� �̹����� �ƴ� ����
    ORD NUMBER DEFAULT 1,
    BNO CONSTRAINT FK_ATTACH_BNO REFERENCES TBL_BOARD(BNO) 
    --�۹�ȣ �ܷ�Ű�� ���ϵڷ�
);

DROP TABLE TBL_ATTACH;

--÷������ ��ȸ

--�����ȸ (ī�װ�ó��)
SELECT * FROM TBL_ATTACH WHERE BNO = 1; --�ε�����ΰ� ����ȭ�� �ȶ�
--����ȸ 
SELECT * FROM TBL_ATTACH WHERE UUID = 1; 

--UUID BNO ��� �ε��� ����
CREATE UNIQUE INDEX IDX_ATTACH_UUID_BNO ON TBL_ATTACH(UUID, BNO DESC);

--��Ʈ ����ؼ� ����ȭ ��� ��������
SELECT /*+ INDEX(TBL_ATTACH IDX_ATTACH_UUID_BNO) */ * FROM TBL_ATTACH WHERE BNO = 1;

SELECT * FROM tbl_board ORDER BY BNO DESC;

SELECT * FROM tbl_attach;

DELETE TBL_BOARD WHERE BNO = 284;

--pk, FK FK INDEX
ALTER TABLE TBL_REPLY ADD CONSTRAINT PK_REPLY PRIMARY KEY(RNO);  --���̺�������
ALTER TABLE TBL_REPLY MODIFY(BNO CONSTRAINT FK_REPLY_BNO REFERENCES TBL_BOARD(BNO)); --COLUMN LEVEL 
ALTER TABLE TBL_REPLY ADD CONSTRAINT FK_REPLY_WRITER FOREIGN KEY(WRITER) REFERENCES TBL_MEMBER(ID); --TABLE LEVEL

-- RNO, BNO ��� INDEX ����
CREATE UNIQUE INDEX IDX_REPLY_RNO_BNO ON TBL_REPLY(RNO, BNO DESC);


--��ȸ����



--�������

SELECT * FROM tbl_reply;
DELETE TBL_REPLY WHERE RNO = 52;


--220324



