<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
    
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
					<!-- <form name="frmS" id="frmS" method="post" enctype="multipart/form-data" onsubmit="fn_search(); return false;"> -->
					<form name="frmS" id="frmS" method="post" enctype="multipart/form-data">
						<div class="search">
							<ul>
								<li class="w100p">
									<b class="label">
										<label>부서</label>
									</b>
									<select id="srch_orgnzt_id1" name="srch_orgnzt_id1" class="w20p" title="부서 1단계">
										<option value="">선택</option>
									</select> 
									<select id="srch_orgnzt_id2" name="srch_orgnzt_id2" class="w20p" title="부서 2단계">
										<option value="">선택</option>
									</select>
									<select id="srch_orgnzt_id3" name="srch_orgnzt_id3" class="w20p" title="부서 3단계">
										<option value="">선택</option>
									</select>
								</li>
							</ul>
							
							<ul class="cols2 last">
								<li>
									<b class="label">
										<label>이름</label>
									</b>
									<input type="text" id="srch_user_nm" name="srch_user_nm" maxlength="10" style="ime-mode: active;" title="이름" />
								</li>
								<li>
									<b class="label">
										<label>성별</label>
									</b>
									<select id="srch_user_gndr" name="srch_user_gndr" style="min-width: 100px;" title="성별">
										<option value="">선택</option>
										<option value="M">남자</option>
										<option value="F">여자</option>
									</select>
								</li>
							</ul>

							<input type="submit" value="검색" class="btn_search">

						</div>
					</form>
					
					<!-- 검색 결과 리스트 -->
					<%-- <div id="contentList">
						<div class="tableBox" style="min-height: 250px;">
							<table class="list hover active">
								<caption>사용자정보목록</caption>

								<colgroup>
									<col style="width: 70px">
									<col style="width: 150px">
									<col style="width: 130px">
									<col>
									<col style="width: 100px">
									<col style="width: 100px">
								</colgroup>

								<thead>
									<tr>
										<th scope="col">No</th>
										<th scope="col">사용자ID</th>
										<th scope="col">사용자명</th>
										<th scope="col">소속부서</th>
										<th scope="col">계급</th>
										<th scope="col">근무상태</th>
									</tr>
								</thead>

								<tbody>

									<c:forEach var="result" items="${resultList}"
										varStatus="status">
										<tr
											onclick="selectWrkrDetail('<c:out value="${result.wrkrSn}"/>')"
											style="cursor: pointer;">
											<td><c:out
													value="${((parmMap.page - 1) * parmMap.rowNum) + (status.count)}" /></td>
											<td><c:out value="${result.wrkrId}" /></td>
											<td><c:out value="${result.wrkrNm}" /></td>
											<td style="text-align: left;"><c:out
													value="${result.psitnOrgnztNm}" /></td>
											<td><c:out value="${result.clssCodeNm}" /></td>
											<td><c:out value="${result.workSttusCodeNm}" /></td>
										</tr>
									</c:forEach>

									<c:if test="${resultCnt == 0}">
										<tr>
											<td colspan="6">등록된 사용자가 없습니다</td>
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

					</div> --%>
					
					<!-- 상세 정보 -->
					<%-- <form name="frmD" id="frmD" method="post"
						enctype="multipart/form-data">

						<input type="hidden" id="wrkr_sn" name="wrkr_sn" /> <input
							type="hidden" id="postng_orgnzt_id" name="postng_orgnzt_id" />

						<div class="tableBox">
							<table class="form">
								<caption>상세내역</caption>
								<colgroup>
									<col style="width: 80px">
									<col style="width: 120px">
									<col style="width: 80px">
									<col style="width: 120px">
									<col style="width: 80px">
									<col style="width: 120px">
								</colgroup>

								<tr>
									<th><label for="wrkr_id">사용자ID</label></th>
									<td><label id="wrkr_id"></label></td>
									<th><label for="wrkr_nm">사용자명</label></th>
									<td><label id="wrkr_nm"></label></td>
									<th><label for="">비밀번호</label></th>
									<td><input type="button" class="btn_s" id="b_pwClear"
										name="b_pwClear" value="비밀번호 초기화" onclick="app_req('S');" />
									</td>
								</tr>

								<tr>
									<th><label for="psitn_orgnzt_nm">소속부서</label></th>
									<td colspan="3"><label id="psitn_orgnzt_nm"></label></td>
									<th><label for="clss_nm">계급</label></th>
									<td><label id="clss_nm"></label></td>
								</tr>

								<tr>
									<th><label for="postng_orgnzt_id1">배치부서<span>*</span></label></th>
									<td colspan="3"><select id="postng_orgnzt_id1"
										name="postng_orgnzt_id1" class="w20p" title="배치부서 1단계">
											<option value="">선택</option>
									</select> <select id="postng_orgnzt_id2" name="postng_orgnzt_id2"
										class="w20p" title="배치부서 2단계">
											<option value="">선택</option>
									</select> <select id="postng_orgnzt_id3" name="postng_orgnzt_id3"
										class="w20p" title="배치부서 3단계">
											<option value="">선택</option>
									</select> <select id="postng_orgnzt_id4" name="postng_orgnzt_id4"
										class="w20p" title="배치부서 4단계">
											<option value="">선택</option>
									</select></td>
									<th><label for="work_sttus_nm">근무상태</label></th>
									<td><label id="work_sttus_nm"></label></td>
								</tr>

								<tr>
									<th><label for="plice_nm">의경여부</label></th>
									<td><label id="plice_nm"></label></td>

									<th><label for="">근무자경과구분</label></th>
									<td colspan="3"><select id="wrkr_elapse_se_code"
										name="wrkr_elapse_se_code" style="min-width: 100px;"
										title="근무자경과구분">
											<option value="">선택</option>
									</select></td>
								</tr>

								<tr>
									<th><label for="offm_telno">사무실전화</label></th>
									<td><label id="offm_telno"></label></td>

									<th><label for="house_telno">주택전화</label></th>
									<td><label id="house_telno"></label></td>

									<th><label for="moblphon_no">이동전화</label></th>
									<td><label id="moblphon_no"></label></td>
								</tr>

								<tr>
									<th><label for="age">연령</label></th>
									<td><label id="age"></label></td>

									<th><label for="sexdstn_nm">성별</label></th>
									<td colspan="3"><label id="sexdstn_nm"></label></td>
								</tr>

							</table>

						</div>

						<div style="text-align: right; margin-top: 5px;">
							<a href="javaScript:void(0);" id="b_clear" class="btn_m"
								onclick="doClear();">초기화</a>
							<c:if test="${progrmAuthMap.updtAt eq 'Y' }">
								<a href="javaScript:void(0);" id="b_Update" class="btn_m on"
									onclick="app_req('U');">수정</a>
							</c:if>
						</div>

					</form> --%>

			</div>
		</div>

	</div>
	
	<script type="text/javascript">
	
    $(function() {

        
    });
	
    // 검색버튼 클릭
    function fn_search() {
        // 소속부서 값 셋팅
        //$("#srch_orgnzt_id").val(CodeUtil.getOrgnztId("srch_orgnzt_id1", "srch_orgnzt_id2", "srch_orgnzt_id3"));
        
        fn_select_List(1);
    }
    
    // 목록 조회
    function fn_select_List(pageNo) {
        document.frmS.page.value = pageNo;
        document.frmS.action = "./srchUserMgmt.do";
        document.frmS.submit();  
    }
    
	</script>

</body>
</html>