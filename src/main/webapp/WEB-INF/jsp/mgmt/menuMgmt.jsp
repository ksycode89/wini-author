<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@page import="egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
    
<%
    /**
     * @Class Name  : menuMgmt.jsp
     * @Description : 메뉴 관리
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
	                <h3>메뉴 관리</h3>
	            </div>
	            
                <div>
                
                	<!-- 메뉴목록 -->
                    <div style="width: 500px; float:left;">
                        <h4>메뉴목록</h4>

                        <form name="frmS" id="frmS" method="post" onsubmit="menuMgmtTree(); return false;">
                        
                            <div class="tableBox">
                                <table class="form">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div style="height: 450px; overflow-y:scroll;">
                                                    <div>
                                                        <ul id="menu_tree" class="easyui-tree"></ul>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            
                            <div style="text-align: right;">
                                                                                     ※ 메뉴목록에서 상위메뉴를 선택한 후 메뉴추가 버튼 클릭<br/>                                                                                  
                                <a href="javascript:void(0);" id="b_AddMenu" class="mainBtn" style="background-color: #577dd0;" onclick="doAddMenu();">메뉴추가</a>
                            </div>
                        
                        </form>
                    </div>
					
					<!-- 메뉴정보 -->
                    <div style="width: 1200px;">
                        <h4>메뉴정보</h4>
                        
                        <div class="tableBox">
                            <form name="frmD" id="frmD" method="post" enctype="form-data">
                            
                            	<input type="hidden" name="menu_step" id="menu_step" />
                            	<input type="hidden" id="sessionUserSn" name="sessionUserSn" value="<c:out value="${userInfo.userSn}"/>"/>
                                
                                <table class="form">
                                    <colgroup>
                                        <col style="width:120px">
                                        <col>
                                        <col style="width:120px">
                                        <col> 
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="upper_menu_id">상위메뉴</label></th>
                                            <td colspan="3">
                                                <div>
                                                    <input type="text" name="upper_menu_id" id="upper_menu_id" style="background-color: #efefef;" readonly="readonly" title="상위메뉴ID" />
                                                    <input type="text" name="upper_menu_nm" id="upper_menu_nm" style="background-color: #efefef;" readonly="readonly" title="상위메뉴" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="progrm_id">메뉴ID</label></th>
                                            <td colspan="3">
                                                <div>
                                                    <input type="text" name="menu_id" id="menu_id" style="ime-mode: disabled;" maxlength="10" title="메뉴ID" />
                                                    <input type="hidden" id="hid_menu_id" name="hid_menu_id" />
                                                    <a href="javascript:void(0);" id="b_MenuIdChk" class="mainBtn" style="display: none; background-color: #577dd0;" onclick="doMenuIdCheck();">중복체크</a>
                                                </div> (MENU001001 형식으로만 메뉴ID를 입력하세요.)
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="menu_nm">메뉴명</label></th>
                                            <td colspan="3">
                                                <div>
                                                    <input type="text" name="menu_nm" id="menu_nm" maxlength="50" style="ime-mode: active;" title="메뉴명" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="menu_url">메뉴URL</label></th>
                                            <td colspan="3">
                                                <div>
                                                    <div>
                                                        <input type="text" name="menu_url" id="menu_url" maxlength="100" style="ime-mode: inactive;" title="메뉴URL" />
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="sort_ordr">정렬순서</label></th>
                                            <td colspan="3">
                                                <div>
                                                    <input type="text" name="sort_ordr" id="sort_ordr" maxlength="5" title="정렬순서"/>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="menu_dc">메뉴설명</label></th>
                                            <td colspan="3">
                                                <div>
                                                    <input type="text" name="menu_dc" id="menu_dc" maxlength="50" style="ime-mode: active;" title="메뉴설명" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="menu_at">메뉴구분</label></th>
                                            <td colspan="3">
                                                <div>
                                                    <select id="menu_at" name="menu_at" title="메뉴구분">
                                                    	<option value="">선택</option>
                                                        <option value="Y">메뉴</option>
                                                        <option value="N">화면</option>
                                                    </select>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="menu_rght">메뉴권한</label></th>
                                            <td>
                                                <div>
                                                    <select id="menu_rght" name="menu_rght" title="메뉴권한">
                                                    	<option value="">선택</option>
                                                        <option value="Y">관리자용</option>
                                                        <option value="N">공용</option>
                                                    </select>
                                                </div>
                                            </td>
                                            <th><label for="use_at">사용여부</label></th>
                                            <td>
                                                <div>
                                                    <select id="use_at" name="use_at" title="사용여부">
                                                        <option value="">선택</option>
                                                        <option value="Y" selected="selected">사용</option>
                                                        <option value="N">미사용</option>
                                                    </select>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="updusr_nm">수정자</label></th>
                                            <td>
                                                <label id="updusr_nm"></label>
                                            </td>
                                            <th><label for="updt_dt">수정일자</label></th>
                                            <td>
                                                <label id="updt_dt"></label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                        
                        <div style="text-align: right;">
                            <a href="javascript:void(0);" id="b_Insert" class="mainBtn" style="background-color: #577dd0;" onclick="doIud('I');">등록</a>
                            <a href="javascript:void(0);" id="b_Update" class="mainBtn" style="background-color: #577dd0;" onclick="doIud('U');">수정</a>
                        </div>
                        
                    </div>
                </div>

			</div>
		</div>

	</div>
	
	<script type="text/javascript">
	
    var menu_checked = false; // 프로그램 id 중복 체크 수행 여부
    var menu_dup = false; 	// 프로그램 id 중복 여부 
	
    $(function() {
    	doClear();
    	menuMgmtTree(); // 메뉴목록 조회
    });
    
    // 초기화
    function doClear() {
        document.frmD.reset();

        $("#menu_id").attr("readonly", false);
        $('#menu_id').css("background-color", "");

        $('#sort_ordr').val("999");
		
        setButton();
        
        menu_checked = false;
        menu_dup = false;

    }
    
    // 버튼 세팅
    function setButton(btnType) {
    	$('#b_Insert').css("display", "none");
        $('#b_Update').css("display", "none");
        $('#b_MenuIdChk').css("display", "none");

        if (btnType == 'I') {
            $('#b_Insert').css("display", "");
            $('#b_MenuIdChk').css("display", "");
        } else if (btnType == 'U') {
            $('#b_Update').css("display", "");
        } 
    }
    
    // 메뉴목록 조회
    function menuMgmtTree() {

        $('#menu_tree').tree({
            url : './menuMgmtTreeList.do',
            lines : true,
            animate : true,
            onClick : function(node) {
            	menuMgmtDetail(node.id);
            }
        });

    }
    
    // 메뉴 상세 조회
    function menuMgmtDetail(menuId) {
        doClear();
        
        if (menuId == "")
            return;

        var ajax_set = {
            url : "./selectMenuMgmtDetail.do",
            param : "menu_id=" + menuId,
            return_fn : function(jdata) {
                set_MenuMgmtDetail(jdata);
            }
        };

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
 	
 	// 메뉴 상세 조회 결과
    function set_MenuMgmtDetail(jdata) {
 		
    	/** SPARROW : NULL_RETURN 조치 **/
        if (jdata != null && jdata.errCd == '-1') {
            alert(jdata.errMsg);
            return;
        }

        if (jdata.rows.length > 0) {

            var detail = jdata.rows[0];

            $('#upper_menu_id').val(detail.upperMenuId);
            $('#upper_menu_nm').val(detail.upperMenuNm);

            $('#menu_id').attr("readonly", true);
            $('#menu_id').css("background-color", "#efefef");
            
            $('#menu_id').val(detail.menuId);
            $('#menu_nm').val(detail.menuNm);
            $('#menu_url').val(detail.menuUrl);
            $('#sort_ordr').val(detail.sortOrdr);
            $('#menu_dc').val(detail.menuDc);
            
            $('#menu_at').val(detail.menuAt);
            
            $('#menu_rght').val(detail.menuRght);
            
            $('#use_at').val(detail.useAt);
			
            $('#updusr_nm').html(detail.updusrNm);
            $('#updt_dt').html(detail.updtDt);

            $('#menu_step').val(detail.menuStep);
            
            setButton('U');
            
        } else {
            alert("조회할 데이터가 없습니다.");
        }

    }
 	
    // 메뉴 추가 버튼 클릭
    function doAddMenu() {
        var menuId = $('#menu_id').val();
        var menuNm = $('#menu_nm').val();
        var menuStep = $('#menu_step').val();
        
        doClear();
        
        if (menuId == null || menuId == "")  {
            alert("메뉴목록에서 상위메뉴를 선택하세요.");
            return;            
        }
        
        if (menuStep > 3) {
            alert("메뉴 추가는 3단계 까지만 가능합니다. ")
            return;            
        }
        
        $('#upper_menu_id').val(menuId);
        $('#upper_menu_nm').val(menuNm);
        
        setButton('I');
    }
    
    // 메뉴ID 중복체크
    function doMenuIdCheck() {
        var menuId = $("#menu_id").val();
        
        if($.trim(menuId) == "") {
            alert("메뉴ID를 입력하세요.");
            menu_checked = false;
            menu_dup = false;
            $("#menu_id").focus();
        } else {
            var ajax_set = {
                url : "./selectMenuMgmtDetail.do",
                param : "menu_id=" + menuId,
                return_fn : function(jdata) {
                	menuIdDupCheck_result(jdata, menuId);
                }
            };

            fn_getDetailAjax(ajax_set);
        }
    }
    
    // 메뉴ID 중복체크 결과
    function menuIdDupCheck_result(jdata, menuId) {
        if(jdata.rows.length == 0) {
            alert("사용가능한 메뉴ID 입니다.");
            menu_checked = true;
            menu_dup = false;
            $("#hid_menu_id").val(menuId);
        } else {
            alert("사용중인 메뉴ID입니다.");
            menu_checked = true;
            menu_dup = true;
            $("#hid_menu_id").val("");
            $("#menu_id").focus();
        }
    }
    
    // 유효성 체크
    function fn_checkNotNull(iud) {
        
        if(iud == "D") return true;
        
        if($.trim($("#menu_id").val()) == "") {
            alert("메뉴ID를 입력하세요.");
            $("#menu_id").focus();
            return false;
        }
        
        if(menu_checked == false && iud == "I") {
            alert("메뉴ID 중복체크를 해주세요.");
            $("#menu_id").focus();
            return false;
        }
        
        if(menu_checked == true && menu_dup == true && iud == "I") {
            alert("메뉴ID가 중복입니다.");
            $("#menu_id").focus();
            return false;
        }
        
        if($.trim($("#menu_id").val()) != $.trim($("#hid_menu_id").val()) && iud == "I") {
            alert("메뉴ID 중복체크를 해주세요.");
            $("#menu_id").focus();
            menu_checked = false;
            menu_dup = false;
            return false;
        }
        
        if($.trim($("#menu_nm").val()) == "") {
            alert("메뉴명을 입력하세요.");
            $("#menu_nm").focus();
            return false;
        }
        
        if($.trim($("#sort_ordr").val()) == "") {
            alert("정렬순서를 입력하세요.");
            $("#sort_ordr").focus();
            return false;
        }
        
        if($.trim($("#menu_at").val()) == "") {
            alert("메뉴구분을 선택하세요.");
            $("#menu_at").focus();
            return false;
        }
        
        if($.trim($("#menu_rght").val()) == "") {
            alert("메뉴권한을 선택하세요.");
            $("#menu_rght").focus();
            return false;
        }
        
        if($.trim($("#use_at").val()) == "") {
            alert("사용여부를 선택하세요.");
            $("#use_at").focus();
            return false;
        }
        
        return true;
        
    }
    
    // 등록, 수정, 삭제
    function doIud(iud) {
        
        var c_firm = " 하시겠습니까?";
        
        if(iud == "I") {
            c_firm = "등록" + c_firm;
        } else if(iud == "U") {
            c_firm = "수정" + c_firm;
        }
        
        if(fn_checkNotNull(iud)) {
            
            var ajax_set = {
                    form_name:"#frmD",
                    url:"./menuMgmtIUD.do?iud="+iud + "&session_user_sn=" + $("#sessionUserSn").val(),
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
            if (!confirm(c_firm)) {
                return;
            }
        }
        $(ajax_set.form_name).ajaxSubmit({ 
            type:"POST",
            dataType:'json',
            url:ajax_set.url, 
            contentType : "application/x-www-form-urlencoded;charset=UTF-8",
            async:false,
            complete: function() {
            },
            error: function(){            
                alert('처리중 오류가 발생하였습니다.');
            },
            success:ajax_set.return_fn
        });
    }
 	
    // 등록, 수정, 삭제 결과
    function doIud_result(jdata, iud) {
        if(jdata.errCd != null && jdata.errCd != "1") {
            alert(jdata.errMsg);
        } else {
            if(iud == "I") {
                alert("등록 되었습니다.");
            } else if(iud == "U") {
                alert("수정 되었습니다.");
            }
            
            menuMgmtTree();
            doClear();
            
        }
    }
    
    
	</script>

</body>
</html>