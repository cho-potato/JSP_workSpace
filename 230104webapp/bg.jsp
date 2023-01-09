<%@ page contentType="text/html;charset=UTF-8"%>
<%
    // 색상 배열 선언
    String[] bgArray = {"RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "NAVY", "PURPLE"};

    // 클라이언트의 파라미터 넘겨받기
    // 웹상으로 전송된 모든 파라미터는 문자열이다
    // 심지어 숫자형으로 넘겨도 문자로 취급한다
    String bg = request.getParameter("bg");
    out.print("넘어온 bg값은 " + bg);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script>
        // 서버에 bg.jsp라는 jsp에 파라미터 전송
        // get 방식으로 보내도 된다(보안상 중요하지 않고, 양이 많지 않기 때문 like 편지 또는 엽서)
        // -> header를 타고 전송한다고 표현한다
        function setBg() {
            // 선택한 select 박스의 값
            let sel = document.querySelector("select");
            location.href = "/bg.jsp?bg="+sel.value;
        }
    </script>
</head>

<body bgcolor="<%=bg%>">
    <select name="" id="">
        <%for (int i = 0; i<bgArray.length; i++) {%>
        <option value="<%=bgArray[i]%>"><%=bgArray[i]%></option>
        <%}%>
    </select>
    <button onClick="setBg()">배경변경</button>
</body>
</html>