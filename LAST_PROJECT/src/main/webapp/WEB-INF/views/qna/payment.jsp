<%--
/**
	Class Name:
	Description:
	Modification information
	
	수정일     수정자      수정내용
    -----   -----  ------------------------------------------------
    2021. 4. 26.       	임하람 
    
    author eclass 개발팀
    since 2020.11.23
    Copyright (C) by KandJang All right reserved.
*/
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../cmn/common.jsp" %>
<%@ include file="../cmn/header.jsp" %>
<c:set var="hContext" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

	<title>결제</title>
	
	  <!-- 부트스트랩 -->
    <link href="${hContext}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${hContext}/resources/css/store-cart.style.css" rel="stylesheet">
    <link href="${hContext}/resources/css/themify-icons.css" rel="stylesheet">
    <link href="${hContext}/resources/css/elegant-icons.css" rel="stylesheet">

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  	<script src="${hContext}/resources/js/jquery.min.js"></script>
    <script src="${hContext}/resources/js/bootstrap.min.js"></script>
    <script src="${hContext}/resources/js/eclass.js"></script>
	<script src="${hContext}/resources/js/eutil.js"></script>
	<script src="${hContext}/resources/js/jquery.bootpag.js"></script>
	
</head>
<body>
${vo}
<input type="text" name="storeSeq"   id="storeSeq" value="${vo.storeSeq}" />
<!-- 결제 데이터 가져오기 -->
		<!-- 제목 -->
	 	<div class="page-header">
	 		<h2>결제</h2>
	 	</div>
	    <!--// 제목 -->
	    
	 <!-- Shopping Payment Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="cart-table">
                        <table id="cartTable">
                            <thead>
                                <tr>
                                	<th style="visibility:hidden;position:absolute;">paySeq</th>
                                	<th style="visibility:hidden;position:absolute;">storeSeq</th>
                                	<th style="visibility:hidden;position:absolute;">memberId</th>
                                    <th>상품명</th>
                                    <th>옵션 1</th>
                                    <th>옵션 2</th>
                                    <th>수량</th>
                                    <th>가격</th>
                                    <th>배송비</th>
                                    <th>합계</th>
                                    <th>결제상태</th>
                                    <th style="visibility:hidden;position:absolute;">modId</th>
                                    <th style="visibility:hidden;position:absolute;">regDt</th>
                                    <th style="visibility:hidden;position:absolute;">modDt</th>
                                   
                                </tr>
                            </thead>
                            <tbody>  
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 offset-lg-4 pull-right">
                            <div class="proceed-checkout">
                                <a href="#" class="proceed-btn" id="paymentBtn">결제</a>
                                <a href="#" class="proceed-btn" id="cancelBtn">취소</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Payment Section End -->

	<!-- javascript -->
	<script type="text/javascript">
	//jquery 객체생성이 완료
	$(document).ready(function() {
		console.log("document ready");
		
		//화면 로딩시 보여줄 데이터 
		doSelctOne(1);
	});//--document ready	
	

	//화면 로딩 시 보여줄 결제 데이터 
	function doSelctOne(){
		console.log("doSelctOne");
		
		var paySeqData ="2021041666";
		
		 let url = "${hContext}/payment/do_selectone.do";
		 let parameters = {"paySeq":paySeqData};
		 let method = "GET";
		 let async = true;
		 
		 console.log("url:"+url);
		 console.log("parameters:"+parameters);
		 
		 EClass.callAjax(url, parameters, method, async, function(data) {
			 console.log("data:"+data);
			 console.log("data.paySeq:"+data.paySeq);
			 
				$("#cartTable>tbody").empty();
			 	var html = "";
			 	
			 	html += "<tr>                                                                                                           ";
				html += "    <td style='visibility:hidden;position:absolute;'>"+data.paySeq+"</td>                                     ";
				html += "    <td style='visibility:hidden;position:absolute;'>"+data.storeSeq+"</td>                                    ";
				html += "    <td style='visibility:hidden;position:absolute;'>"+data.memberId+"</td>                                     ";
				html += "    <td class='cart-title first-row' id='title'>"+data.title+"</td>                                           ";
				html += "    <td class='cart-option first-row' id='optone'>"+data.optone+"</td>                                        ";
				html += "    <td class='cart-option first-row' id='opttwo'>"+data.opttwo+"</td>                                        ";
				html += "    <td class='qua-col first-row'>                                                                             ";
				html += "        <div class='quantity'>                                                                                 ";
				html += "            <div class='pro-qty'>                                                                              ";
				html += "                <input type='text' id='quantity' value="+data.quantity+">                                     ";
				html += "            </div>                                                                                             ";
				html += "        </div>                                                                                                 ";
				html += "    </td>                                                                                                      ";
				html += "    <td class='p-price first-row'>"+numberWithCommas(data.quantity*data.price)+"원</td>                       ";
				html += "    <td class='p-shipfee first-row' id='shipfee'>"+numberWithCommas(data.shipfee)+"원</td>                     ";
				html += "    <td class='p-price first-row' id='price'>"+numberWithCommas(data.price)+"원</td>                           ";
				html += "    <td class='p-status first-row' id='status'>"+data.status+"</td>                           				";
				html += "    <td style='visibility:hidden;position:absolute;'>"+data.modId+"</td>                                     ";
				html += "    <td style='visibility:hidden;position:absolute;'>"+data.regDt+"</td>                                     ";
				html += "    <td style='visibility:hidden;position:absolute;'>"+data.modDt+"</td>                                     ";
				html += "</tr>                                                                                                          ";

			 
				//body에 데이터 추가
				$("#cartTable>tbody").append(html);	
		 });
	}//--doSelctOne
	
	
	//결제버튼
	$("#paymentBtn").on("click",function(e){
		console.log("paymentBtn");
		e.preventDefault();//한번만 호출
		
/* 		
		
		 let url = "${hContext}/payment/do_insert.do";
		 let parameters = {
				 			"paySeq" 	: paySeq,
							"storeSeq"  : $("#storeSeq").val(),
							"memberId"  : memberId,
							"title"     : $("#title").val(),
							"optone"    : $("#optone").val(),
							"opttwo"    : $("#opttwo").val(),
							"quantity"  : $("#quantity").val(),
							"price"     : $("#price").val(),
							"shipfee"   : shipfee,
							"status"	: status,
							"modId"		: memberId
						};
		 let method = "POST";
		 let async = true;	
		 
		console.log("parameters:"+parameters);
		console.log("url:"+url);
		 
		 if(confirm("결제 하시겠습니까?")==false) return;
		 
		 EClass.callAjax(url, parameters, method, async, function(data) {
				 console.log("data:"+data);
				 console.log("data:"+data.paySeq);
				 console.log("data:"+data.storeSeq);
				 console.log("data:"+data.memberId);
				 
				 //성공/실패 여부 메세지 출력
				 console.log("data.msgContents:"+data.msgContents);
				 
				 if("1"==data.msgId){//결제성공
					 alert(data.msgContents);
						//결제성공시 화면이동
						//moveTomain();
				 }else{//결제실패
					 alert(data.msgId+"\n"+data.msgContents); 
				 }
				 
			 }); */
	 	
	});//--paymentBtn
	
	
	//결제 성공시 화면이동(해창님-Community_Home으로 이동)
	function moveTomain(){
		console.log("moveTomain");
		
		window.location.href = "${hContext}/houses/home_view.do?memberId="+memberId ;
	}
	
	//결제 취소
	//확인완료
		$("#cancelBtn").on("click",function(e){
			console.log("cancelBtn");

			e.preventDefault(); //지정했는데 여러번 클릭됨...
			
			var paySeqData ="20210416";
			
			 let url = "${hContext}/payment/do_delete.do";
			 let parameter = {
					 			"paySeq" : paySeqData};
			 let method = "POST";
			 let async = true;	
			 
			console.log("parameter:"+parameter);
			console.log("url:"+url);
			 
			 if(confirm("결제를 취소하시겠습니까?")==false) return;
			 
			 EClass.callAjax(url, parameter, method, async, function(data) {
					 console.log("data:"+data);
					 console.log("data:"+data.paySeq);
					 
					 //성공/실패 여부 메세지 출력
					 console.log("data.msgContents:"+data.msgContents);
					 
					 if("1"==data.msgId){//취소성공
						 alert(data.msgContents);
							//취소성공시 화면이동
							//moveTomain();
					 }else{//취소실패
						 alert(data.msgId+"\n"+data.msgContents); 
					 }
					 
				 });
			
		});	//--cancelBtn

			
	/* 숫자 3자리 콤마찍기 */
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}		
	

	</script>
	<!-- //javascript -->
</body>
</html>