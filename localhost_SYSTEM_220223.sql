SELECT * fROM TAB;
-- ���� / ����


--��������
CREATE USER STUDENT IDENTIFIED BY 1234;

--���Ѻο�
GRANT CONNECT, RESOURCE TO STUDENT;

--HR ���� LOCK ���� �� ��й�ȣ ���� 
-- HR���� �޸ո��ҽ� ������ �ִ� ����Ŭ ���� �������ε� ������� ��й�ȣ�� �̻��Ҳ�
ALTER USER HR IDENTIFIED BY 1234;
ALTER USER HR IDENTIFIED BY 1234 ACCOUNT UNLOCK;
ALTER USER HR ACCOUNT UNLOCK IDENTIFIED BY 1234;