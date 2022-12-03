<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<title>회원 수정</title>
</head>
<body>
   <%@ include file="../menu.jsp" %>
   <div class="jumbotron">
      <div class="container">
         <h1 class="display-3">회원 수정</h1>
      </div>
   </div>
   <%@ include file="../dbconn.jsp" %>
   <%
      String sql = " select * from member where m_id = ? ";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, sessionId);
      rs = pstmt.executeQuery();
      if(rs.next()){
      
   %>
   <div class="container">
      <form name="newMember" class="form-horizontal" action="processUpdateMember.jsp" method="post" onsubmit="return checkForm()">
         <input type="hidden" name="id" value='<%= rs.getString("m_id")%>'/>
         <div class="form-group  row">
            <label class="col-sm-2 ">아이디</label>
            <div class="col-sm-3">
               <input type="text" class="form-control" placeholder="id" value='<%= rs.getString("m_id")%>' disabled>
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">비밀번호</label>
            <div class="col-sm-3">
               <input name="password" type="text" class="form-control" placeholder="password" value='<%= rs.getString("m_password")%>' >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">비밀번호확인</label>
            <div class="col-sm-3">
               <input name="password_confirm" type="text" class="form-control" placeholder="password_confirm" >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">성명</label>
            <div class="col-sm-3">
               <input name="name" type="text" class="form-control" placeholder="name" value='<%= rs.getString("m_name")%>' >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">성별</label>
            <div class="col-sm-10">
               <c:set value='<%= rs.getString("m_gender")%>' var="gender"/>
               <input name="gender" type="radio" value="남" <c:if test = "${gender.equals('남') }"><c:out value="checked"/></c:if>>남 
               <input name="gender" type="radio" value="여" <c:if test = "${gender.equals('여') }"><c:out value="checked"/></c:if>>여
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2">생일</label>
            <div class="col-sm-4">
               <c:set value='<%= rs.getString("m_birth") %>' var="birth"/>
               <c:set value="${birth.split('/')[0] }" var="year"/>
               <c:set value="${birth.split('/')[1] }" var="month"/>
               <c:set value="${birth.split('/')[2] }" var="day"/>
               <input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6" value="${year }"> 
               <select name="birthmm"   id="birthmm">
               <option value="${month }">월</option>
               <option value="01"<c:if test="${month == 01 }"><c:out value="selected"/></c:if>>1</option>
               <option value="01"<c:if test="${month == 02 }"><c:out value="selected"/></c:if>>2</option>
               <option value="01"<c:if test="${month == 03 }"><c:out value="selected"/></c:if>>3</option>
               <option value="01"<c:if test="${month == 04 }"><c:out value="selected"/></c:if>>4</option>
               <option value="01"<c:if test="${month == 05 }"><c:out value="selected"/></c:if>>5</option>
               <option value="01"<c:if test="${month == 06 }"><c:out value="selected"/></c:if>>6</option>
               <option value="01"<c:if test="${month == 07 }"><c:out value="selected"/></c:if>>7</option>
               <option value="01"<c:if test="${month == 08 }"><c:out value="selected"/></c:if>>8</option>
               <option value="01"<c:if test="${month == 09 }"><c:out value="selected"/></c:if>>9</option>
               <option value="01"<c:if test="${month == 10 }"><c:out value="selected"/></c:if>>10</option>
               <option value="01"<c:if test="${month == 11 }"><c:out value="selected"/></c:if>>11</option>
               <option value="01"<c:if test="${month == 12 }"><c:out value="selected"/></c:if>>12</option>
               </select> <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" value="${day }">
            </div>
         </div>
         <div class="form-group  row ">
            <label class="col-sm-2">이메일</label>
            <div class="col-sm-10">
               <c:set value = '<%= rs.getString("m_mail") %>' var ="mail"/>
               <c:set value = "${mail.split('@')[0] }" var ="mail1"/>
               <c:set value = "${mail.split('@')[1] }" var ="mail2"/>
               <input type="text" name="mail1" maxlength="50" value="${mail1 }">@
               <select name="mail2" id="mail2">
                     <option value="naver.com" <c:if test="${mail2.equals('naver.com') }"><c:out value="selected"/></c:if>>naver.com</option>
                     <option value="daum.net" <c:if test="${mail2.equals('daum.net') }"><c:out value="selected"/></c:if>>daum.net</option>
                     <option value="gmail.com" <c:if test="${mail2.equals('gmail.com') }"><c:out value="selected"/></c:if>>gmail.com</option>
                     <option value="nate.com" <c:if test="${mail2.equals('nate.com') }"><c:out value="selected"/></c:if>>nate.com</option>
               </select>
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">전화번호</label>
            <div class="col-sm-3">
               <input name="phone" type="text" class="form-control" placeholder="phone" value='<%=rs.getString("M_PHONE")%>'>
            </div>
         </div>

         <div class="form-group  row">
            <label class="col-sm-2 ">주소</label>
            <div class="col-sm-5">
               <input name="address" type="text" class="form-control" placeholder="address" value='<%=rs.getString("M_ADDRESS")%>'>
            </div>
         </div>
         <div class="form-group  row">
            <div class="col-sm-offset-2 col-sm-10 ">
               <input type="submit" class="btn btn-primary" value="회원수정 "> 
               <a href="#" class="btn btn-primary" onclick="removeMember()">회원탈퇴</a>
            </div>
         </div>
      </form>   
   </div>
   <%
      }
   %>
</body>
</html>
<script type="text/javascript">
   function checkForm() {
      if (!document.newMember.id.value) {
         alert("아이디를 입력하세요.");
         return false;
      }
      if (!document.newMember.password.value) {
         alert("비밀번호를 입력하세요.");
         return false;
      }
      if (document.newMember.password.value != document.newMember.password_confirm.value) {
         alert("비밀번호를 동일하게 입력하세요.");
         return false;
      }
   }
   function removeMember(){
      if(confirm("정말 탈퇴하시겠습니까?")){
         location.href = "deleteMember.jsp";
      }
   }
</script>