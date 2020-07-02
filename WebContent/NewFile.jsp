<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">


function add(){
     var obj = document.getElementsByName('BUSINESS'); //'BUSINESS' 를 포함한 Tag들을 찾아서 배열로 만들어준다.
     //alert(obj[0].id);
     var i= obj.length ;
     //alert("i:" +i);
     document.getElementById('myTable').innerHTML += 
   	"상위옵션 : <input type='text' name='BUSINESS' id='option1Name' value='" +i+"'> <input type='text' name='BUSINESS' value='" +i+"'>"
       +"<input type='button' id='BUSINESSBUTTON' name='"+i+"' value='x' onClick='del(this.name);'> <br>" + 
       "하위옵션: <input type='text' name='BUSINESS' value='" +i+"'> <input type='text' name='BUSINESS' value='" +i+"'>"
		+"<input type='button' id='BUSINESSBUTTON' name='"+i+"' value='x' onClick='del(this.name);'> <br>";
       

       
}

function del(id){ //여기서 id는 x버튼을 눌러서 넘겨준 this.value값이 되겠다. 삭제할 버튼을 찾기위함.
   //alert("del:"+id);
   var obj = document.getElementsByName('BUSINESS');
   var button = document.getElementsByName('BUSINESSBUTTON');
   obj[id].outerHTML="";
   button[id].outerHTML="";

   //삭제한뒤 다시한번 현재 남은 inputbox의 값을 읽어서 다시 재설정 해준다.

      button = document.getElementsByName('BUSINESSBUTTON'); 
      for(var k=0; k < button.length ;k++){
        button[k].name= k;
      }
}

function textsize(){
   var obj = document.getElementsByName('BUSINESS');
   var button = document.getElementsByName('BUSINESSBUTTON');
   alert("objsize:"+obj.length);
   alert("buttonsize:"+button.length);
}
</script>
</head>
<body>
  <div id="myTable">
  테스트박스<br>
  </div>
	
  <!--  'id' 값으로 여기다 넣겠습니다. 를 지정해준다. table, div, td, span 에서가능

    그럼 테스트 박스 다음에 innerHTML 에서 지정해준 값이 들어오겠다. -->


  <input type="button" value="추가" onclick="add();">
  <input type="button" value="삭제" onClick="alert((this.value));"> <!-- this는 자기자신, 클릭한 버튼의 .속성 값을 넘겨준다. -->
  <input type="button" value="size" onClick="textsize();">

</body>


</html>