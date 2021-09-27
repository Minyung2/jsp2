-- �����Խ��� : ���̺� 2��(���α� ����, ��� ����)

create table freeboard(
	idx int not null auto_increment,
	name varchar(30) not null,			-- �ۼ���
	password varchar(10) not null,		-- �� ��й�ȣ
	subject varchar(40) not null,		-- �� ����
	content varchar(2000) not null,		-- �� ����
	readCount int default 0,			-- ��ȸ��
	wdate datetime default current_timestamp,	-- �ۼ� �ð� default ������ ���� ��¥/�ð�
	ip varchar(15) default '127.0.0.1',			-- �ۼ��� ip
	commentCount smallint default 0,			-- ��� ����
	primary key(idx)
);

select * from freeboard;
insert into freeboard (name, password, subject, content, ip)
values ('honey', '1234','�����Խ����Դϴ�','�����Խ����Դϴ�','123.456.17.0');
insert into freeboard (name, password, subject, content, ip)
values ('User','1234','1��','1��','192.168.17.3');
insert into freeboard (name, password, subject, content, ip)
values ('park','0000', '�ȳ�', '�ݰ���', '192.173.28.0');
insert into freeboard (name, password, subject, content, ip)
values ('hello','0000','����','���ɸ޴���õ��','193.171.23.1');
insert into freeboard (name, password, subject, content, ip)
values ('����','1234','��������','�ű���������','193.172.68.1');
insert into freeboard (name, password, subject, content, ip)
values ('�뷡','486','��й�ȣ','����','153.171.23.1');
insert into freeboard (name, password, subject, content, ip)
values ('�ڰ�','freeboard','�ڰ�','����','173.171.23.1');

-- mysql ���� limit Ű���� : limit ��ȣ, ����
-- mysql, oracle select ����� ���� ���࿡ ������� ��ȣ�� �ο��ϴ� �÷�(row num)�� ��������ϴ�.
-- limit�� ��ȣ�� row num �Դϴ�. (mysql �� 0���� ����)
select * from freeboard f order by idx desc limit 0,15;		-- 1������ ��� : 0���� 15�� ������
select * from freeboard f order by idx desc limit 15,15;	-- 2������ ��� : 15���� 15�� ������
select * from freeboard f order by idx desc limit 30,15;	-- 3������ ���
select * from freeboard f order by idx desc limit 30,15;	
-- ���� : n=10 ������ ����?
select * from freeboard f order by idx desc limit 135,15;
select * from freeboard f ;
-- �� ���� : subject, content.
update freeboard set subject ='�ڷ�����', content= '����' where idx=150;

-- ��ȸ�� ���� : ���� ������ (url ��û �߻�) ī��Ʈ + 1
update freeboard set readCount = readCount +1 where idx=150;

-- �� ���� : �� ��й�ȣ 1) ���� �� 2) ���� ��
delete from freeboard where idx= 154 and password ='daff';
delete from freeboard where idx= 154;