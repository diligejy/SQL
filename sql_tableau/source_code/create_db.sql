CREATE DATABASE EDU  --[EDU] 데이터베이스를 사용합니다.

-- [회원테이블] 생성
CREATE TABLE [회원테이블] (
[회원번호] VARCHAR(20) PRIMARY KEY,
[이름] VARCHAR(20),
[성별] VARCHAR(2),
[나이] INT,
[가입금액] MONEY,
[가입일자] DATE NOT NULL,
[수신동의] BIT
)

