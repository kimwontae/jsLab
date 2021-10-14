<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- header -->
<%@ include file="/view/include/header.jspf" %>

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		//ë³ì gì í¬ë¡ì¤ ëë©ì¸ì ë°ì´í°ë¥¼ ê°ì ¸ì¬ ì ìëë¡ êµ¬ê¸ ì£¼ìë¥¼ ì ì¥íììµëë¤.
		//var g="https://ajax.googleapis.com/ajax/services/feed/load?v=2.0&num=10&callback=?&q=";
		var g = "https://api.rss2json.com/v1/api.json?rss_url=";

		$("#news_wrap h2 a").on(
				"click",
				function(e) {
					e.preventDefault(); //<a> íê·¸ì ë§í¬ë¥¼ ì°¨ë¨íììµëë¤.
					$("#news_wrap h2 a").removeClass("on"); //<a>ì "on" classë¥¼ ì­ì í©ëë¤.
					$(this).addClass("on"); //í´ë¦­í <a>ì class="on"ì ìì±í©ëë¤.
					$.ajax({
						url : g + $(this).attr("href"), //ìì²­í  ë°ì´í° ê²½ë¡.
						dataType : "json", //ìì²­í  ë°ì´í°ì íì.
						success : function(data) { //ì±ê³µì ì¼ë¡ ìì²­íìì ë...
							//obj = JSONtoString(data);
							var obj = JSON.stringify(data);
							

							$("#news_list").empty(); //<ul>ì íì ììë¥¼ ëª¨ë ì ê±°í©ëë¤.
							//console.log(data.responseData.feed.entries);

							//$.each(data.responseData.feed.entries,function(i, d){
							$.each(data.items, function(i, d) {
								if (i == 5)
									return false;
								var title = d["title"]; //title í¤ì ê°ì ê°ì ¸ìµëë¤.
								//var date=new Date(d["publishedDate"]); //ë´ì¤ ìì± ë ì§ ê°ì²´ ìì±
								var date = new Date(d["pubDate"]); //ë´ì¤ ìì± ë ì§ ê°ì²´ ìì±
								//ìì±í ë-ì-ì¼ íìì¼ë¡ ë³ì mì ì ì¥í©ëë¤.
								var m = date.getFullYear() + "-"
										+ (date.getMonth() + 1) + "-"
										+ date.getDate();
								var lk = d["link"];
								//ìì êµ¬í´ì¨ ë°ì´í°ë¥¼ ì´ì©í´ ì ë³´ ëª©ë¡ íê·¸ë¥¼ ìì±í©ëë¤.
								$("#news_list").append(
										'<li><a href="'+lk+'" target="_blank">'
												+ title + '</a> <span>' + m
												+ '</span></li>');
							}); // â$.eachâ ë©ìëì ì¢ë£
						} // âsuccess: functionâì ì¢ë£
					}); // $.ajax() ë©ìëì ì¢ë£
				}); // ì´ë²¤í¸ on ë©ìëì ì¢ë£

		$("#news_wrap h2 a").eq(0).click(); //ìµì´ ì²« ë²ì§¸ í­ ë²í¼ì ê°ì ë¡ í´ë¦­ìíµëë¤.
	});
</script>
		<style type="text/css">
/*ê¸°ë³¸ ì¸í*/
* {
	margin: 0;
	padding: 0;
}

li {
	list-style: none;
}

body {
	font: 12px Margun Gothic, "ë§ìê³ ë", gulim, "êµ´ë¦¼", sans-serif;
	color: #333;
	padding-top: 20px;
}

h1, h2, h3, h4, h5, h6 {
	font-size: 100%;
	font-weight: normal;
}

a {
	color: #333;
	text-decoration: none;
	outline: none;
}

h1 {
	font-size: 2em;
	text-align: center;
	margin-bottom: 10px;
	color: #c00;
}

/*í­ ë©ë´ ëìì¸*/
#news_wrap {
	width: 500px;
	margin: 0 auto;
	background: #FFF url("images/rss_bg.gif") 0 0 repeat-x;
}

#news_wrap li {
	height: 25px;
	line-height: 25px;
	position: relative;
}

#news_wrap span {
	position: absolute;
	top: 0;
	right: 3px;
}

#news_wrap li a {
	display: block;
	width: 210px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	padding-left: 15px;
	background: url("images/bullet.gif") 5px 10px no-repeat;
}

#news_wrap h2 {
	float: left;
	padding-right: 3px;
	margin-bottom: 10px;
}

#news_list {
	clear: both;
}

/*ë¹íì±í í­ ë²í¼ ëª¨ì*/
#news_wrap h2 a {
	display: inline-block;
	padding: 8px 10px;
	border: 1px solid #aaa;
	border-bottom: none;
	border-radius: 5px 5px 0 0;
	background: #ccc;
}
/*ë¹íì±í í­ ë²í¼ ëª¨ì*/
#news_wrap h2 a.on {
	background-color: #fff;
	font-weight: bold;
}





			<!--sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					ì¡°ì ì¼ë³´ <small></small>
				</h1>
				
				<div id="news_wrap">
					<h2>
						<!-- ì´ê¸°ì ì²« ë²ì§¸ ë²í¼ìë§ class="on"ì´ í¬í¨ëì´ ììµëë¤. -->
						<a href="http://myhome.chosun.com/rss/www_section_rss.xml"
							class="on"> ì¤ëì ì£¼ìë´ì¤</a>
					</h2>
					<h2>
						<a href="http://www.chosun.com/site/data/rss/ent.xml">ìí°íì´ë¨¼í¸</a>
					</h2>
					<h2>
						<a
							href="http://newsplus.chosun.com/hitdata/xml/se/sports/index.xml">ì¤í¬ì¸ </a>
					</h2>
					<h2>
						<a href="hhttps://rss.donga.com/total.xml">ëìì¼ë³´</a>
					</h2>
					<ul id="news_list">
					</ul>
					
			</section>

			<div class="pad margin no-print">
				<div class="callout callout-info"
					style="margin-bottom: 0 !important;">
					<h4>
						<i class="fa fa-info"></i> Note:
					</h4>
					This page has been enhanced for printing. Click the print button at
					the bottom of the invoice to test.
				</div>
			</div>
	

			<!-- Main content -->
			<section class="invoice">
				<!-- title row -->

				<!-- this row will not appear when printing -->
				<div class="row no-print">
					<div class="col-xs-12">
						<a href="invoice-print.html" target="_blank"
							class="btn btn-default"><i class="fa fa-print"></i> Print</a>
						<button type="button" class="btn btn-success pull-right">
							<i class="fa fa-credit-card"></i> Submit Payment
						</button>
						<button type="button" class="btn btn-primary pull-right"
							style="margin-right: 5px;">
							<i class="fa fa-download"></i> Generate PDF
						</button>
					</div>
				</div>
			</section>
			<!-- /.content -->
			<div class="clearfix"></div>
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer no-print">
			<div class="pull-right hidden-xs">
				<b>Version</b> 2.4.0
			</div>
  <!-- footer -->
<%@ include file="/view/include/footer.jspf" %>
