<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

//계획추가
function add_Plan(){
    //alert("i:" + i);
   var obj_Plan = document.getElementsByName('BUSINESS_LOG_PLAN');
   var i = obj_Plan.length; //readonly input box의 name을 다르게 줘도 되고, 같게준다면 obj_plan.length-1로 한다.

   document.getElementById('view_plan_box').innerHTML += "&nbsp;<input type='text'   

   name='BUSINESS_LOG_PLAN' size='77'>"+"&nbsp;&nbsp;<input type='button' id='BUSINESS_PBUTTON'       
   name='"+i+"' value=' x ' onClick='javascript:del_Plan(this.name);'>";
}
//계획삭제
function del_Plan(id){
   var obj_Plan = document.getElementsByName('BUSINESS_LOG_PLAN');
   var button = document.getElementsByName('BUSINESS_PBUTTON');
   obj_Plan[id].outerHTML="";
   button[id].outerHTML="";

 

 //삭제한뒤 다시한번 현재 남은 inputbox의 값을 읽어서 다시 재설정 해준다.

    button = document.getElementsByName('BUSINESS_PBUTTON'); 
    for(var k=0; k < button.length ;k++){
      button[k].name= k;
    }
}

</script>
</head>
<body>
  <div id=view_plan_box style="width:600px; margin-left:3px;">
  </div>
&nbsp;<input type="text" class="readonly" name="BUSINESS_LOG_PLAN_EX" size="77" readonly="readonly"/>
&nbsp;<input type="button" value="계획추가" onClick="javascript:add_Plan();"/>
</body>

</html>