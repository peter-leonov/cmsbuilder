function OpenColors(imgUrl) {
	imgUrl = (imgUrl=='undefined') ? '' : imgUrl;
	var newWindowFeatures="dependent=1,Height=200,Width=200";
	var board=window.open("","Colors",newWindowFeatures);
	board.document.open();
	board.document.write("<html>");
	board.document.write("<head><title>����� �����</title></head>");
	board.document.write("<body topmargin=0 leftmargin=0>");
	board.document.write("<table align=center id=Colors border=1 width=100% bgcolor=white><tr style='cursor: hand;'><td width='12%' bgcolor='#FF9999'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#FF9999'),window.close()\"></td><td width='12%' bgcolor='#FFFF99'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#FFFF99'),window.close()\"></td><td width='12%' bgcolor='#99FF99'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#99FF99'),window.close()\"></td><td width='12%' bgcolor='#00FF99'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#00FF99'),window.close()\"></td><td width='13%' bgcolor='#99FFFF'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#99FFFF'),window.close()\"></td><td width='13%' bgcolor='#0099FF'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#0099FF'),window.close()\"></td><td width='13%' bgcolor='#FF99CC'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#FF99CC'),window.close()\"></td><td width='13%' bgcolor='#FF99FF'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#FF99FF'),window.close()\"></td></tr><tr style='cursor: hand;'><td width='12%' bgcolor='#FF0000'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#FF0000'),window.close()\"></td><td width='12%' bgcolor='#FFFF00'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#FFFF00'),window.close()\"></td><td width='12%' bgcolor='#99FF00'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#99FF00'),window.close()\"></td><td width='12%' bgcolor='#00FF33'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#00FF33'),window.close()\"></td><td width='13%' bgcolor='#00FFFF'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#00FFFF'),window.close()\"></td><td width='13%' bgcolor='#0099CC'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#0099CC'),window.close()\"></td><td width='13%' bgcolor='#9999CC'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#9999CC'),window.close()\"></td><td width='13%' bgcolor='#FF00FF'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#FF00FF'),window.close()\"></td></tr><tr style='cursor: hand;'><td width='12%' bgcolor='#993333'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#993333'),window.close()\"></td><td width='12%' bgcolor='#FF9933'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#FF9933'),window.close()\"></td><td width='12%' bgcolor='#00FF00'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#00FF00'),window.close()\"></td><td width='12%' bgcolor='#009999'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#009999'),window.close()\"></td><td width='13%' bgcolor='#003399'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#003399'),window.close()\"></td><td width='13%' bgcolor='#9999FF'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#9999FF'),window.close()\"></td><td width='13%' bgcolor='#990033'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#990033'),window.close()\"></td><td width='13%' bgcolor='#FF0099'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#FF0099'),window.close()\"></td></tr><tr style='cursor: hand;'><td width='12%' bgcolor='#990000'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#990000'),window.close()\"></td><td width='12%' bgcolor='#FF9900'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#FF9900'),window.close()\"></td><td width='12%' bgcolor='#009900'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#009900'),window.close()\"></td><td width='12%' bgcolor='#009933'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#009933'),window.close()\"></td><td width='13%' bgcolor='#0000FF'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#0000FF'),window.close()\"></td><td width='13%' bgcolor='#000099'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#000099'),window.close()\"></td><td width='13%' bgcolor='#990099'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#990099'),window.close()\"></td><td width='13%' bgcolor='#9900FF'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#9900FF'),window.close()\"></td></tr><tr style='cursor: hand;'><td width='12%' bgcolor='#330000'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#330000'),window.close()\"></td><td width='12%' bgcolor='#993300'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#993300'),window.close()\"></td><td width='12%' bgcolor='#003300'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#003300'),window.close()\"></td><td width='12%' bgcolor='#003333'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#003333'),window.close()\"></td><td width='13%' bgcolor='#000099'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#000099'),window.close()\"></td><td width='13%' bgcolor='#000033'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#000033'),window.close()\"></td><td width='13%' bgcolor='#330033'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#330033'),window.close()\"></td><td width='13%' bgcolor='#330099'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#330099'),window.close()\"></td></tr><tr style='cursor: hand;'><td width='12%' bgcolor='#000000'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#000000'),window.close()\"></td><td width='12%' bgcolor='#999900'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#999900'),window.close()\"></td><td width='12%' bgcolor='#999933'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#999933'),window.close()\"></td><td width='12%' bgcolor='#999999'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#999999'),window.close()\"></td><td width='13%' bgcolor='#339999'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#339999'),window.close()\"></td><td width='13%' bgcolor='#CCCCCC'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#CCCCCC'),window.close()\"></td><td width='13%' bgcolor='#330033'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#330033'),window.close()\"></td><td width='13%' bgcolor='#FFFFFF'><img src='"+imgUrl+"editor/img/blank.gif' border='0' onClick=\"window.opener.FormatText('ForeColor', '#FFFFFF'),window.close()\"></td></tr><tr><td colspan='8' align='center'>������ ����<br>#<input size='8' maxlength='6' name='OtherColor'><input type='button' value='ok'  onClick=\"window.opener.FormatText('ForeColor', document.all.OtherColor.value),window.close()\"></td></tr></table>");
	board.document.write("</body>");
	board.document.write("</html>");
	board.document.close();

}