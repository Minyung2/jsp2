-- 자유게시판 : 테이블 2개(메인글 저장, 댓글 저장)

create table freeboard(
	idx int not null auto_increment,
	name varchar(30) not null,			-- 작성자
	password varchar(10) not null,		-- 글 비밀번호
	subject varchar(40) not null,		-- 글 제목
	content varchar(2000) not null,		-- 글 내용
	readCount int default 0,			-- 조회수
	wdate datetime default current_timestamp,	-- 작성 시간 default 서버의 현재 날짜/시간
	ip varchar(15) default '127.0.0.1',			-- 작성자 ip
	commentCount smallint default 0,			-- 댓글 개수
	primary key(idx)
);

select * from freeboard;
insert into freeboard (name, password, subject, content, ip)
values ('honey', '1234','자유게시판입니다','자유게시판입니다','123.456.17.0');
insert into freeboard (name, password, subject, content, ip)
values ('User','1234','1빠','1빠','192.168.17.3');
insert into freeboard (name, password, subject, content, ip)
values ('park','0000', '안녕', '반가워', '192.173.28.0');
insert into freeboard (name, password, subject, content, ip)
values ('hello','0000','오늘','점심메뉴추천좀','193.171.23.1');
insert into freeboard (name, password, subject, content, ip)
values ('나야','1234','여보세요','거기잘지내니','193.172.68.1');
insert into freeboard (name, password, subject, content, ip)
values ('노래','486','비밀번호','윤하','153.171.23.1');
insert into freeboard (name, password, subject, content, ip)
values ('자게','freeboard','자게','ㅇㅇ','173.171.23.1');

-- mysql 에는 limit 키워드 : limit 번호, 개수
-- mysql, oracle select 결과에 대해 각행에 순서대로 번호를 부여하는 컬럼(row num)이 만들어집니다.
-- limit의 번호는 row num 입니다. (mysql 은 0부터 시작)
select * from freeboard f order by idx desc limit 0,15;		-- 1페이지 목록 : 0부터 15개 보여줌
select * from freeboard f order by idx desc limit 15,15;	-- 2페이지 목록 : 15부터 15개 보여줌
select * from freeboard f order by idx desc limit 30,15;	-- 3페이지 목록
select * from freeboard f order by idx desc limit 30,15;	
-- 계산식 : n=10 페이지 글은?
select * from freeboard f order by idx desc limit 135,15;
select * from freeboard f ;
-- 글 수정 : subject, content.
update freeboard set subject ='자러간다', content= 'ㅂㅇ' where idx=150;

-- 조회수 변경 : 읽을 때마다 (url 요청 발생) 카운트 + 1
update freeboard set readCount = readCount +1 where idx=150;

-- 글 삭제 : 글 비밀번호 1) 있을 떄 2) 없을 때
delete from freeboard where idx= 154 and password ='daff';
delete from freeboard where idx= 154;