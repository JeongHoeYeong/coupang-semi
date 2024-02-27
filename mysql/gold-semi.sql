DROP TABLE user;
DROP TABLE food;
DROP TABLE  foodreview;
DROP TABLE lodgment;
DROP TABLE lodgmentreview;
DROP TABLE noticeboard;
DROP TABLE noticetwo;
DROP TABLE review;
DROP TABLE reviewnotice;
DROP TABLE save;
DROP TABLE total;
DROP TABLE tourist;
DROP TABLE touristreview;

CREATE TABLE user(
	id VARCHAR(20) PRIMARY KEY,	-- 아이디
    password VARCHAR(2000),	-- 비밀번호
    name VARCHAR(10),	-- 이름
    email VARCHAR(100),	-- 이메일
    address VARCHAR(50), -- 주소
    phone VARCHAR(20),	-- 전화번호
    nickname VARCHAR(20),	-- 닉네임
    gender VARCHAR(4), 	-- 성별
    resident VARCHAR(15),	-- 주민번호
    auth VARCHAR(20),	-- 관리 등급
    enabled VARCHAR(2)	-- 회원 탈퇴 여부
);

CREATE TABLE review(
	reviewnum int(4) NOT NULL PRIMARY KEY AUTO_INCREMENT, -- 리뷰번호
    id VARCHAR(20), 	-- 아이디
    reviewcontent VARCHAR(100),	-- 리뷰내용
    commencontent VARCHAR(100), -- 댓글내용
	starpoint int(5),-- 별점
    date DATETIME DEFAULT now(), -- 날짜
    image VARCHAR(500)	-- 이미지
);

CREATE TABLE reviewnotice(
	reviewnoticenum int(4) PRIMARY KEY, -- 리뷰댓글 번호
    id VARCHAR(20),	-- 아이디
    reviewnum int(4), 	-- 리뷰번호
    noticedate DATETIME,	-- 작성날짜
    reviewboard VARCHAR(100)	-- 리뷰댓글내용
);

CREATE TABLE foodreview(
	foodreviewnum int(4) PRIMARY KEY,	-- 식당 리뷰 번호
    reviewnum int(4),	-- 리뷰번호
    registnum int(4)	-- 식당등록번호
);

CREATE TABLE food(
	foodcode int(4) PRIMARY KEY,	-- 식당 등록번호
    open DATETIME DEFAULT now(),	-- 영업시간
    foodaddress VARCHAR(30),	-- 주소
    foodname VARCHAR(10),	-- 식당명
    foodphone VARCHAR(13),	-- 연락처
    look int(4)	-- 조회수
);

CREATE TABLE touristreview(
	touristreviewnum int(4) PRIMARY KEY,	-- 관광지 리뷰번호
	reviewnum int(4),	-- 리뷰번호
    registnum int(4)	-- 관광지 등록번호
);

CREATE TABLE tourist(
	touristcode int(4) PRIMARY KEY,	-- 등록번호
	touristname VARCHAR(20),	-- 관광명
    touristaddress VARCHAR(20), -- 주소
    look int(4)	-- 조회수
);

CREATE TABLE lodgmentreview(
	lodgmentreviewnum int(4) PRIMARY KEY,	-- 숙소 리뷰번호
	reviewnum int(4),	-- 리뷰번호
    registnum int(4)	-- 숙소 등록번호
);


CREATE TABLE lodgment(
	lodgmentcode int(4) PRIMARY KEY,	-- 숙소 코드
    lodgmentaddress VARCHAR(20),  -- 주소
    lodgmentname VARCHAR(10), -- 숙소명
	lodgmentroom int(5),	-- 객실 수
	lodgmentarmy VARCHAR(100), -- 부대시설	
    lodgmentphone VARCHAR(13), -- 연락처
    look int(4)	-- 조회수
);

CREATE TABLE total(
	code VARCHAR(4) PRIMARY KEY,
    foodcode int(4),	-- 식당 등록번호
    touristcode int(4),	-- 등록번호
    lodgmentcode int(4)	-- 숙소 코드
);

CREATE TABLE save(
	savenum int(4) PRIMARY KEY,	-- 찜 번호
    id VARCHAR(20),	-- 아이디
    code int(4)	-- 코드
);

CREATE TABLE noticeboard(
	noticeboardnum int(4) PRIMARY KEY, -- 게시판 번호
    date DATETIME,	-- 등록일
    id VARCHAR(20),	-- 아이디
    look int(4),	-- 조회수
    goodpoint int(4), -- 좋아요 
    title VARCHAR(10),	-- 제목
    board VARCHAR(100)	-- 내용
);

CREATE TABLE noticetwo(
	noticetwo int(4) PRIMARY KEY,	-- 게시판 댓글 번호
    date DATETIME,		-- 작성날짜
    noticecontent VARCHAR(100),		-- 댓글 내용
    id VARCHAR(20),		-- 아이디
	noticeboardnum int(4)		-- 게시판번호
);










