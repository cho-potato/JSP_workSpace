<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script>
        function setBg() {
            let sel = document.querySelector("select");
            location.href = "/homework2.jsp?bg="+sel.value;
        }
    </script>
</head>
<%
    String[] bgArray = {"RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "NAVY", "PURPLE"};

    String bg = request.getParameter("bg");
%>
<body bgcolor="<%=bg%>">
    <select name="" id="">
        <%for (int i = 0; i<bgArray.length; i++) {%>
        <option value="<%=bgArray[i]%>"><%=bgArray[i]%></option>
        <%}%>
    </select>
    <button onClick="setBg()">색상변경</button>
</body>
</html>