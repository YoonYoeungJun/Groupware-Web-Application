function printCenterArea()
  {
		alert("주의사항!\n인쇄 설정을 횡(가로)방향으로 하여 출력하세요.");
    var pDoc = document.body.innerHTML;
    if(pDoc)
    {

      var pDoc_start = pDoc.indexOf("Content Start");
      var pDoc_end = pDoc.lastIndexOf("Content End");

      if(pDoc_start>0 && pDoc_end>0)
        pDoc_after = "<!-- " + pDoc.substring(pDoc_start, pDoc_end) + "Content End -->";
      else
        pDoc_after = pDoc;


		  var printWinId = window.open('','','width=780,height=500,top=10,left=10,scrollbars=yes');
      var strHtml = "";
      strHtml += "<html><head>";
      strHtml += "<title>미리보기</title>\n";
      strHtml += "<link rel='stylesheet' href='../style_ess.css' type='text/css'>\n";
		  strHtml += "<script language='javascript'>           \n";
      strHtml += "function prints()                        \n";
      strHtml += "{                                        \n";
      strHtml += "  document.title='인쇄중...';            \n";
      strHtml += "  print_tr.style.display='none';         \n";
      strHtml += "  factory.printing.header='';            \n";
      strHtml += "  factory.printing.footer='';            \n";
      strHtml += "  factory.printing.portrait=true;        \n";
      strHtml += "  factory.printing.leftMargin=5.0;      \n";
      strHtml += "  factory.printing.topMargin=10.0;       \n";
      strHtml += "  factory.printing.rightMargin=5.0;     \n";
      strHtml += "  factory.printing.bottomMargin=5.0;    \n";
      strHtml += "  factory.printing.Print(false, window); \n";
      strHtml += "  print_tr.style.display='';             \n";
      strHtml += "  document.title='미리보기';             \n";
      strHtml += "}                                        \n";
      strHtml += "</script>                                \n";
      strHtml += "<script>\n";
      strHtml += " function MM_swapImgRestore() {  \n";
      strHtml += "   var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc; \n";
      strHtml += " } \n";
      strHtml += "  \n";
      strHtml += " function MM_preloadImages() {  \n";
      strHtml += "   var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array(); \n";
      strHtml += "     var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++) \n";
      strHtml += "     if (a[i].indexOf('#')!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}} \n";
      strHtml += " } \n";
      strHtml += "  \n";
      strHtml += " function MM_findObj(n, d) {  \n";
      strHtml += "   var p,i,x;  if(!d) d=document; if((p=n.indexOf('?'))>0&&parent.frames.length) { \n";
      strHtml += "     d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);} \n";
      strHtml += "   if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n]; \n";
      strHtml += "   for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); \n";
      strHtml += "   if(!x && d.getElementById) x=d.getElementById(n); return x; \n";
      strHtml += " } \n";
      strHtml += "  \n";
      strHtml += " function MM_swapImage() {  \n";
      strHtml += "   var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3) \n";
      strHtml += "    if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];} \n";
      strHtml += " }\n";
      strHtml += "</script>\n";
      strHtml += "</head><body align='center' onload='javascript:self.print();'>\n";
      strHtml += "<div id='contents_text'>\n";
      strHtml += "<table border=0 cellspacing=5 cellpadding=5 width=100%><tr><td align='center'>";
      strHtml += "<table border=0 cellspacing=0 cellpadding=0 width=99%><tr><th align='center'>\n\n";
      strHtml +=  pDoc_after;
      strHtml += "\n\n</th></tr><tr id='print_tr'><td align='center'><br>\n";
      strHtml += "<table width='100%' border='0' cellpadding='0' cellspacing='0'>\n";
      strHtml += "<tr><td height='2' bgcolor='#D0D0D0'></td></tr>\n";
      strHtml += "<tr><td height='10'></td></tr>\n";
      strHtml += "<tr><td align='right'>\n";
      strHtml += "<a href='javascript:self.print();' class='link'>[프린트]</a>\n";
      strHtml += "<a href='javascript:self.close();' class='link'>[닫기]</a>\n";
      strHtml += "</td></tr></table>";
      strHtml += "</td></tr></table>";
      strHtml += "</td></tr></table>";
      strHtml += "</div>";
      strHtml += "</body></html>";

      printWinId.document.open();
      printWinId.document.write(strHtml);
      printWinId.document.focus();
      printWinId.document.close();
    } else alert("페이지 내용을 불러오는데 문제가 발생했습니다.");
}