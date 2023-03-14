<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@page import="egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
    
<%
    /**
     * @Class Name  : userMgmt.jsp
     * @Description : 사용자 관리
     * @Modification Information
     * 
     *     수정일                               수정자                                              수정내용
     *  ----------      --------    ---------------------------
     *  2023.03.08        PSH                  최초 생성
     *
     * author PSH
     * since 2023.03.08
     *  
     */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	
	<div id="content">

		<div id="contentHolder">
			<div class="contentPage">
				<div class="contentTitle">
	                <h3>사용자 관리</h3>
	            </div>
					
					<!-- 검색 -->
					<form name="frmS" id="frmS" method="post" enctype="form-data" onsubmit="fn_search(); return false;">
					
						<input type="hidden" id="page" name="page" value="<c:out value="${parmMap.page }"/>"/>
					
						<div class="search">
							
							<ul class="cols2 last">
								<li>
									<b class="label">
										<label>이름</label>
									</b>
									<input type="text" id="srch_user_nm" name="srch_user_nm" maxlength="10" value="<c:out value="${parmMap.srch_user_nm }"/>" style="ime-mode: active;" title="이름" />
								</li>
								<li>
									<b class="label">
										<label>성별</label>
									</b>
									<select id="srch_user_gndr" name="srch_user_gndr" style="min-width: 100px;" title="성별">
										<option value="">선택</option>
										<option value="M">남자</option>
										<option value="W">여자</option>
									</select>
								</li>
							</ul>

							<input type="submit" value="검색" class="btn_search">

						</div>
					</form>
					
					<!-- 검색 결과 리스트 -->
					<div id="contentList">
						<div class="tableBox" style="min-height: 250px;">
							<table class="list hover active">
								<colgroup>
									<col style="width: 70px">
									<col style="width: 150px">
									<col style="width: 130px">
									<col style="width: 100px">
								</colgroup>

								<thead>
									<tr>
										<th scope="col">No</th>
										<th scope="col">사용자ID</th>
										<th scope="col">사용자명</th>
										<th scope="col">성별</th>
									</tr>
								</thead>

								<tbody>

									<c:forEach var="result" items="${resultList}" varStatus="status">
										<tr onclick="selectUserDetail('<c:out value="${result.userSn}"/>')" style="cursor: pointer;">
											<td><c:out value="${((parmMap.page - 1) * parmMap.rowNum) + (status.count)}" /></td>
											<td><c:out value="${result.userId}" /></td>
											<td><c:out value="${result.userNm}" /></td>
											<td><c:out value="${result.userGndr}" /></td>
										</tr>
									</c:forEach>

									<c:if test="${resultCnt == 0}">
										<tr>
											<td colspan="4">등록된 사용자가 없습니다</td>
										</tr>
									</c:if>

								</tbody>
							</table>
						</div>
						<%
                           PaginationInfo paginationInfo = (PaginationInfo) request.getAttribute("paginationInfo");
                           if ( paginationInfo != null && (paginationInfo.toString().indexOf("<") >=0 || paginationInfo.toString().indexOf(">") >=0 ) ) {
                           	return;
                           }
                        %>
                                   
						<div class="pageArea">
							<ui:pagination paginationInfo="<%=paginationInfo %>" type="image" jsFunction="fn_select_List" />
						</div>

					</div>
					
					<!-- 상세 정보 -->
					<form name="frmD" id="frmD" method="post" enctype="form-data">
					
						<input type="hidden" id="user_sn" name="user_sn" />
						
						<div class="tableBox">
							<table class="form">
								<caption></caption>
								<colgroup>
									<col style="width: 80px">
									<col style="width: 120px">
									<col style="width: 80px">
									<col style="width: 120px">
									<col style="width: 80px">
									<col style="width: 120px">
								</colgroup>

								<tr>
									<th><label for="user_id">사용자ID</label></th>
									<td><label id="user_id"></label></td>
									<th><label for="user_nm">사용자명</label></th>
									<td><label id="user_nm"></label></td>
									<th><label for="">비밀번호</label></th>
									<td><input type="button" class="btn_s" id="b_PwClear" name="b_PwClear" value="비밀번호 초기화" onclick="doIud('S');" /></td>
								</tr>

								<tr>
									<th><label for="dt_brt">생년월일</label></th>
									<td><label id="dt_brt"></label></td>

									<th><label for="user_gndr">성별</label></th>
										<td colspan="3">
											<select id="user_gndr" name="user_gndr" style="min-width: 100px;" title="성별">
												<option value="">선택</option>
												<option value="M">남자</option>
												<option value="W">여자</option>
											</select>
										</td>
								</tr>

								<tr>
									<th><label for="moblphon_no">전화번호</label></th>
									<td><label id="moblphon_no"></label></td>

									<th><label for="email_adres">이메일</label></th>
									<td><label id="email_adres"></label></td>

									<th><label for="rght">권한</label></th>
										<td>
											<select id="rght" name="rght" style="min-width: 100px;" title="권한">
												<option value="">선택</option>
												<option value="Y">있음</option>
												<option value="N">없음</option>
											</select>
										</td>
								</tr>

							</table>

						</div>
						
						<!-- 버튼 -->
						<div style="text-align: right; margin-top: 5px;">
							<a href="javaScript:void(0);" id="b_Clear" class="btn_m" onclick="doClear();">초기화</a>
							<a href="javaScript:void(0);" id="b_Update" class="btn_m on" onclick="doIud('U');">수정</a>
						</div>

					</form>

			</div>
		</div>

	</div>
	
	<script type="text/javascript">
	
    $(function() {
    	doClear();
    });
    
    // 초기화
    function doClear() {
        
    	$("#user_sn").val("");
        $("#user_id").html("");
        $("#user_nm").html("");
        $("#dt_brt").html("");
        $("#user_gndr").val("");
        $("#moblphon_no").html("");
        $("#email_adres").html("");
        $("#rght").val("");
        
        setButton();
    }
    
    // 버튼 세팅
    function setButton(btnType) {
        $('#b_Update').css("display", "none");
        $('#b_PwClear').css("display", "none");

        if (btnType == 'U') {
            $('#b_Update').css("display", "");
            $('#b_PwClear').css("display", "");
        }
    }
	
    // 검색버튼 클릭
    function fn_search() {
        fn_select_List(1);
    }
    
    // 목록 조회
    function fn_select_List(pageNo) {
        document.frmS.page.value = pageNo;
        document.frmS.action = "./srchUserMgmt.do";
        document.frmS.submit();
    }
    
    // 상세조회
    function selectUserDetail(userSn) {
        if(userSn == "") {
            alert("사용자정보가 없습니다.");
            return false;
        }
        
        var ajax_set = {
                url:"./userMgmtDetail.do",
                param:"user_sn=" + userSn,
                return_fn:function(jdata) {
                    selectUserDetail_result(jdata);
                }
        }
        
        fn_getDetailAjax(ajax_set);
    }
    
 	// 상세조회 호출
    function fn_getDetailAjax(ajax_set) {
        
        $.ajax({
            type: "POST",
            url: ajax_set.url,
            data: ajax_set.param,
            processData: false,
            dataType: 'json',
            error: function(){
                alert('조회중 오류가 발생하였습니다.');
            },
            success: ajax_set.return_fn
        });
    }
    
    // 상세조회 결과
    function selectUserDetail_result(jdata) {
        if(jdata == null) {
            alert("상세조회를 실패했습니다.");
            return;
        }
        
        if(jdata.rows.length > 0) {
            doClear();
            
            var item = jdata.rows[0];
			
            $("#user_sn").val(item.userSn);
            $("#user_id").html(item.userId);
            $("#user_nm").html(item.userNm);
            $("#dt_brt").html(item.dtBrt);
            $("#user_gndr").val(item.userGndr);
            $("#moblphon_no").html(item.moblphonNo);
            $("#email_adres").html(item.emailAdres);
            $("#rght").val(item.rght);
            
            setButton('U');
        }
    }
    
    // 데이터 유효성 체크
    function fn_checkNotNull(iud) {
        
        if(iud == "S"){ 
        	return true; 
        }
        
        if($.trim($("#user_gndr").val()) == "") {
            alert("성별을 선택해주세요.");
            $("#user_gndr").focus();
            return false;
        }
        
        if($.trim($("#rght").val()) == "") {
            alert("권한을 선택해주세요.");
            $("#rght").focus();
            return false;
        }
        
        return true;
        
    }
    
    // 등록, 수정, 삭제
    function doIud(iud) {
        var c_firm = " 하시겠습니까?";
        
        if(iud == "U") {
            c_firm = "수정" + c_firm;
        } else if(iud == "S") {
            c_firm = "비밀번호를 초기화 " + c_firm;
        }
        
        if(fn_checkNotNull(iud)) {
            var ajax_set = {
                    form_name:"#frmD",
                    url:"./userMgmtIUD.do?iud="+iud,
                    return_fn:function(jdata){
                    	doIud_result(jdata, iud);
                    }
            }
            
            fn_submitIUDAjax(ajax_set, c_firm);
        }
    }
    
 	// 등록, 수정, 삭제 등 트랜젝션 발생 시 사용
    function fn_submitIUDAjax(ajax_set, c_firm) { 
        if (c_firm != null && c_firm != "") {
            //fn_submit_ingView(true);
            if (!confirm(c_firm)) {
                //fn_submit_ingView(false);
                return;
            }
        }
        $(ajax_set.form_name).ajaxSubmit({ 
            type:"POST",
            dataType:'json',
            url:ajax_set.url, 
            contentType : "application/x-www-form-urlencoded;charset=UTF-8",
            async:false,
            beforeSubmit : fn_beforeSubmit,
            complete: function() {
                //fn_submit_ingView(false);
            },
            error: function(){            
                alert('처리중 오류가 발생하였습니다.');
                //fn_submit_ingView(false);
            },
            success:ajax_set.return_fn
        });
    }
 	
  //저장 등 do_submitIUD 발생시 진행 중 표시 화면
    function fn_submit_ingView(flag){
        if (flag) {
            var h = $("body").height();
            $("#wini_submit_ing").css({height:h});
            $("#wini_submit_ing").show();
            $("#wini_window_mask_cont").show();
        } else {
            $("#wini_submit_ing").hide();
            $("#wini_window_mask_cont").hide();
        }
        
    }
 	
    // 등록,수정,삭제 결과
    function doIud_result(jdata, iud) {
        if(jdata.errCd != null && jdata.errCd == "-1") {
            alert(jdata.errMsg);
        } else {
            if(iud == "U") {
                alert("수정 되었습니다.");
            } else if(iud == "S") {
                alert("초기화 되었습니다.");
            }
        }
    }
    
	</script>

</body>
</html>