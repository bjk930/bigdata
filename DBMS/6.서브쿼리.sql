--[VI] SUB QUERY; QUERY안에 QUERY가 내포
-- 1. 서브 쿼리 개념
-- 실행할 서브 쿼리를 F9키 누르면 그것만 실행됨. 
-- 급여를 제일 많이 받는 사람의 이름과 급여
SELECT ENAME, MAX(SAL) 
    FROM EMP 
    GROUP BY ENAME; --무의미
SELECT ENAME, SAL --서브쿼리
    FROM EMP
    WHERE SAL = (SELECT MAX(SAL) FROM EMP);--메인쿼리(실행할 쿼리)  -- 반드시 괄호로 감싸야 한다.
--서브쿼리의 종류 : (1) 단일행서브쿼리(단일행) = > >= < <= <> .............. 
--                (2) 다중행서브쿼리(2행이상)
--	SCOTT과 같은 부서에서 근무하는 사원의 이름과 부서번호를 출력
SELECT ENAME, DEPTNO
    FROM EMP
    WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT');
-- JOB이 매니저인 사람의 부서이름
SELECT DNAME
    FROM DEPT
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER'); --DEPTNO IN (10,20,30) 서브쿼리가 여러행이 나오면 IN연산자를 써야 한다.
INSERT INTO DEPT VALUES (50,'IT','DALLAS'); --50 기본키
INSERT INTO EMP (EMPNO, ENAME, DEPTNO) VALUES (9999,'홍',50);-- 50자리에도 서브쿼리(S DEPTNO F W) 할 수 있음.
-- SCOTT과 같은 근무지인 사람의 이름과 급여
SELECT ENAME, SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND LOC=(SELECT LOC FROM DEPT D, EMP E WHERE D.DEPTNO=E.DEPTNO AND ENAME='SCOTT');
ROLLBACK;
-- SCOTT과 동일한 직책을 가진 사원의 모든 필드
SELECT *
    FROM EMP
    WHERE JOB=(SELECT JOB FROM EMP WHERE ENAME='SCOTT');
-- 다중열서브쿼리
--SCOTT 과 JOB과 부서번호가 같은 직원의 모든 필드 출력
SELECT *
    FROM EMP
    WHERE (JOB,DEPTNO)=(SELECT JOB, DEPTNO FROM EMP WHERE ENAME='SCOTT');
-- 다중행서브쿼리 : IN ALL ANY(SOME) EXISTS
SELECT ENAME, HIREDATE, DEPTNO
    FROM EMP
    WHERE (DEPTNO,HIREDATE) IN (SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO);
    
SELECT * 
    FROM EMP
    WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO=30);
SELECT * 
    FROM EMP
    WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO=30); 
--직속부하가 있는 직원들의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL
    FROM EMP E
    WHERE EXISTS (SELECT * FROM EMP WHERE E.EMPNO=MGR);
--EX1. 직급이 MANAGER인 사람이 속한 부서의 부서번호와 지역명
SELECT DISTINCT D.DEPTNO, D.LOC
    FROM DEPT D
    WHERE D.DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER'); 
--EX2. 연봉이 3000이상인 사람들 중 연봉등급별 최고 연봉을 받는 사람들의 사번, 이름, 직업, 입사일, 급여, 급여등급
SELECT EMPNO, ENAME, JOB, HIREDATE, SAL, GRADE
    FROM EMP E, SALGRADE S
    WHERE SAL BETWEEN LOSAL AND HISAL 
        AND (GRADE, SAL) IN (SELECT GRADE, MAX(SAL) FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL AND SAL>=3000 GROUP BY GRADE);
--EX3. 입사 분기별 최고월급을 받는 사원의 분기, 사번, 이름, JOB, 상사사번, 입사, 급여, 상여
SELECT  CEIL(TO_CHAR(HIREDATE,'MM')/3), EMPNO, ENAME, JOB, MGR, HIREDATE, SAL ,COMM
    FROM EMP
    WHERE (CEIL(TO_CHAR(HIREDATE,'MM')/3),SAL) IN (SELECT CEIL(TO_CHAR(HIREDATE,'MM')/3),MAX(SAL) FROM EMP GROUP BY CEIL(TO_CHAR(HIREDATE,'MM')/3));
--EX4. SALESMAN인 모든 사원들보다 급여를 많이 받는 사원의 이름, 급여    (ALL)
SELECT ENAME, SAL
    FROM EMP
    WHERE SAL>ALL(SELECT SAL FROM EMP WHERE JOB='SALESMAN');
--EX5. 급여가 3000미만인 사람중 최근 입사한 사원의 사번, 이름,연봉, 입사일
SELECT EMPNO, ENAME, SAL*12+NVL(COMM,0), HIREDATE
    FROM EMP
    WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP WHERE SAL<3000);