--MEMBER 
--����, �ּ�, �̸���(����)

-- javaman MEMBER, MANAGER, ADMIN

-- id, auth
-- javaman role_member 
-- javaman role_manager
-- javaman role_admin

-- 8������ javaman  (������ 755 ���ѻ���)
-- ADMIN, MANAGER, MEMBER
-- 0      0        1           >> �Ϲ�ȸ��
-- 1      1        1           >> �ְ������

-- ADMIN, SUPERVISOR, MANAGER, MEMBER >> 32����




SELECT * FROM TBL_MEMBER;

DELETE TBL_MEMBER WHERE ID = 'kaka';



-- �ּ�
DROP TABLE TBL_MUSINSA_SAMPLE;
CREATE TABLE TBL_MUSINSA_SAMPLE (
    NO NUMBER PRIMARY KEY,
    TITLE VARCHAR2(2000),
    INFO VARCHAR2(4000),
    PRICE VARCHAR2(1000),
    LINK VARCHAR2(2000)
);

SELECT * FROM TBL_MUSINSA_SAMPLE;