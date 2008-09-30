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
var defaults=3;

function select_type_rice(type){
    type_rice = price[type];
}

function select_type_pack(type){
    pack_wieght = pack[type];
}

function caculate(id){
    var form = $(id);
    var text = form.getInputs('text');
    if(Number(text[2].value)!=0){
        text[3].value = Number(text[1].value) - Number(text[2].value);
        text[5].value = Number(text[4].value)*Number(text[3].value);
    }else {}
    // Set Text box Disable 
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

function buy_onsave(id){
    var url   = 'buy/addbuy.jsp';
    var form  = $(id);
    var type  = "";
    var text  = form.getInputs('text');
    var radio = form.getInputs('radio');

    // get type selection
    for(i=0;i<radio.length;i++)
      if(radio[i].checked==true)
         if(i==2)
              type = text[1].value;
         else type = radio[i].value;

    // initiant variable
    var pars = "id="+text[0].value;
        pars+= "&buy="+all_price;
        pars+= "&type_rice="+type;
        pars+= "&date="+Date.getDate().toString();
        pars+= "&weight="+wieght;

    // initaint sent data
    var myAjax = new Ajax.Request( url, {
                        method: 'post',
                        parameters: pars,
                        onLoading: showLoadbuy,
                        onComplete:printbuy
                    } );
}
  function addkey(e){
     if(e.keyCode==32)
       addValue('purchase');
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
function sale_onsave(id){
    var url   = 'sale/addsale.jsp';
    var form  = $(id);
    var type  = "";
    var text  = form.getInputs('text');
    var radio = form.getInputs('radio');

    // get type selection
    for(i=0;i<radio.length;i++)
      if(radio[i].checked==true)
         if(i==2)
              type = text[1].value;
         else type = radio[i].value;

    // initiant variable
    var pars = "id="+text[0].value;
        pars+= "&sale="+all_price;
        pars+= "&type_rice="+type;
        pars+= "&date="+Date.getDate().toString();
        pars+= "&weight="+wieght;

    // initaint sent data
    var myAjax = new Ajax.Request( url, {
                        method: 'post',
                        parameters: pars,
                        onLoading: showLoadbuy,
                        onComplete:printsale
                    } );
}

function printbuy(){
    
}

function printsale(){
    
}