function edit_task()
{
var tag="Tambah tag: <input id=\"tambahtag\" type=\"text\" name=\"tag\"><br>";
var hapus_tag="hapus tag: <input id=\"hapustag\" type=\"text\" name=\"hapus_tag\"><br>";
var deadline="Deadline: <input id=\"editdeadline\" onfocus=\"showCalendarControl(this)\" type=\"text\" name=\"deadline\"><br>"
var assignee="Tambah assignee: <input id=\"tambahassignee\" type=\"text\" name=\"assignee\"><br>";
var hapus_assignee="Hapus assignee: <input id=\"hapusassignee\" type=\"text\" name=\"hapus_assignee\"><br>";
var submit="<button id=\"submit\" onclick=\"edit_task_ajax()\">KLIK UNTUK EDIT</button><br>";
var stringform=tag+hapus_tag+deadline+assignee+hapus_assignee+submit
document.getElementById("atribut").innerHTML=stringform;	
document.getElementById("editbutton").innerHTML="";
}

