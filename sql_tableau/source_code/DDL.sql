USE EDU

-- [회원테이블]에 [몸무게] 컬럼 추가, 데이터 형식은 REAL
ALTER TABLE [회원테이블] ADD [몸무게] REAL

-- [회원테이블]에 [몸무게] 컬럼 데이터 형식 INT로 변경
ALTER TABLE [회원테이블] ALTER COLUMN [몸무게] INT;

-- [회원테이블]에 [몸무게] 컬럼 [몸무게(kg)]로 변경
SP_RENAME '[회원테이블].[몸무게]', '몸무게(kg)';

-- [회원테이블] 테이블명 [MEMBER]로 변경
SP_RENAME '[회원테이블]', 'MEMBER'

-- [MEMBER] 테이블 모든 행 데이터 삭제
TRUNCATE TABLE [MEMBER]

-- [MEMBER] 테이블 삭제
DROP TABLE [MEMBER]