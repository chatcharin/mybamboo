function mmLoadMenus() {
    if (window.menu_customer) return;
    window.menu_customer = new Menu("root",55,20,"Microsoft Sans Serif",14,"#CC6600","#FFFFFF","#FFFFFF","#CC6600","center","middle",3,0,0,-5,7,true,true,true,0,true,true);
    menu_customer.addMenuItem("ดูข้อมูลลูกค้า","location='customer/customerview.jsp'");
    menu_customer.addMenuItem("เพิ่มลูกค้า","location='customer/createcustomer.jsp'");
    menu_customer.addMenuItem("ค้นหา","location='customer/searchcustomer.jsp'");
    menu_customer.hideOnMouseOut=false;
    menu_customer.bgColor='#CC6600';
    menu_customer.menuBorder=1;
    menu_customer.menuLiteBgColor='#FFFFFF';
    menu_customer.menuBorderBgColor='#CC6600';
    window.menu_employee = new Menu("root",55,20,"Microsoft Sans Serif",14,"#CC6600","#FFFFFF","#FFFFFF","#CC6600","center","middle",3,0,0,-5,7,true,true,true,0,true,true);
    menu_employee.addMenuItem("ดูข้อมูลพนักงาน","location='view user.jsp'");
    menu_employee.addMenuItem("เพิ่มพนักงาน","location='AddUser.jsp'");
    menu_employee.addMenuItem("ค้นหา","location='DelUser.jsp'");
    menu_employee.hideOnMouseOut=false;
    menu_employee.bgColor='#555555';
    menu_employee.menuBorder=1;
    menu_employee.menuLiteBgColor='#FFFFFF';
    menu_employee.menuBorderBgColor='#CC6600';
    window.menu_cop = new Menu("root",55,20,"Microsoft Sans Serif",14,"#CC6600","#FFFFFF","#FFFFFF","#CC6600","center","middle",3,0,0,-5,7,true,true,true,0,true,true);
    menu_cop.addMenuItem("ดูข้อมูลโรงสี","location='view user.jsp'");
    menu_cop.addMenuItem("เพิ่มโรงสี","location='AddUser.jsp'");
    menu_cop.addMenuItem("ค้นหา","location='DelUser.jsp'");
    menu_cop.hideOnMouseOut=false;
    menu_cop.bgColor='#555555';
    menu_cop.menuBorder=1;
    menu_cop.menuLiteBgColor='#FFFFFF';
    menu_cop.menuBorderBgColor='#CC6600';
    menu_cop.writeMenus();
}

var type_rice;
var unit_pack;
var pack_wieght;
var wieght;
var defaults=4;
var all_price;

function select_type_rice(type){
    type_rice = price[type];
}

function select_type_pack(type){
    pack_wieght = pack[type];
}

function caculate(id){
    var form  = $(id);
    var text  = form.getInputs('text');
    var weigthpack = text[defaults-2].value;
    var length = text[defaults-1].value;
    var allweigth= new Number();
    for(i=1;i<(length+1);i++)
        allweigth += Number(text[i+defaults+20].value);
    alert(allweigth);
    text[201+defaults+20].value = allweigth;
    text[202+defaults+20].value = (Number(weigthpack)*Number(length));
    wieght                      = allweigth-(Number(weigthpack)*Number(length));
    text[203+defaults+20].value = wieght;
    all_price                   = Number(text[204+defaults+20].value) * Number(text[203+defaults+20].value);
    text[205+defaults+20].value = all_price;
}

function clean(id){
    index_value=0;
    $(id).reset();
}

function test_variable(id,i){
    var form = $(id);
    var text = form.getInputs('text');
    alert(text[i].value);
}

function purchase_onsave(id){
    var url   = 'purchase/addpurchase.jsp';
    var form  = $(id);
    var text  = form.getInputs('text');

    // initiant variable
    var pars = "id="+text[0].value;
        pars+= "&allprice="+all_price;
        pars+= "&type_rice="+ type_rice;
        pars+= "&weight="+wieght;

    // initaint sent data
    var myAjax = new Ajax.Request( url, {
                        method: 'post',
                        parameters: pars,
                        onLoading: loadlogout,
                        onComplete:print
                    } );
}

function addkey(e,id){
     if(e.keyCode==32)
       addValue(id);
 }

var index_value = new Number();
function addValue(id){
    var form  = $(id);
    var text  = form.getInputs('text');
    var addtext  = form.getInputs('text');
    index_value ++;
    addtext[index_value+defaults+20].value = Number(text[defaults].value);
    text[defaults].value= '';
    text[defaults-1].value=index_value;
}

function getselectpack(ob,id){
    var form  = $(id);
    var text  = form.getInputs('text');
    for (var i = 0; i < ob.options.length; i++)
        if (ob.options[i].selected)
           text[defaults-2].value=ob.options[i].value;
}

function getselecttype(ob,id){
    var form  = $(id);
    var text  = form.getInputs('text');
    for (var i = 0; i < ob.options.length; i++)
        if (ob.options[i].selected){
           type_rice = ob.options[i].value;
           text[204+defaults+20].value=type_rice;
        }
}

function sale_onsave(id){
    var url   = 'sale/addsale.jsp';
     var form  = $(id);
    var text  = form.getInputs('text');

    // initiant variable
    var pars = "id="+text[0].value;
        pars+= "&allprice="+all_price;
        pars+= "&type_rice="+ type_rice;
        pars+= "&weight="+wieght;

    // initaint sent data
    var myAjax = new Ajax.Request( url, {
                        method: 'post',
                        parameters: pars,
                        onLoading: loadlogout,
                        onComplete:print
                    } );
}

function logouts(){
      var url   = 'template/logout.jsp';
      var pars;
      var myAjax = new Ajax.Request( url, {
                        method: 'post',
                        parameters: pars,
                        onLoading: loadlogout,
                        onComplete:submitlogout
                    } );
}
function loadlogout(){

}
function submitlogout(){
     document.logout.submit();
}
function printPurchase(){
 MM_openBrWindow('purchase/print.jsp','ใบเสร็จรับเงิน','scrollbars=yes,resizable=yes,width=490,height=410');
}

function print(){
    $('cancel').style.display   = "none";
    $('print').style.display    = "block"; 
}
function MM_openBrWindow(theURL,winName,features) { //v2.0
      window.open(theURL,winName,features);
 }