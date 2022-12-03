<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 3행,6행은 부트스트랩 적용 과정에서 디폴트로 파일 생성시 기본 적용된 태그입니다. -->
<title>Form Processing</title>
</head>
<body>
    <!--책의 결과 화면URL에 입력 데이터정보가 없으므로 post방식임  -->
    <form action="form03_process.jsp" method="post">
        오렌지<input type="checkbox" name="name" value="오렌지">
        사과<input type="checkbox" name="name" value="사과">
        바나나<input type="checkbox" name="name" value="바나나">
        <input type="submit" value="전송">
    </form>
</body>
</html>
