function mmLoadMenus() {
    if (window.menu_customer) return;
    window.menu_customer = new Menu("root",55,20,"Microsoft Sans Serif",14,"#CC6600","#FFFFFF","#FFFFFF","#CC6600","center","middle",3,0,0,-5,7,true,true,true,0,true,true);
    menu_customer.addMenuItem("àÃÕÂ¡´Ù","location='view costomer.jsp'");
    menu_customer.addMenuItem("à¾ÔèÁ","location='add costomer.jsp'");
    menu_customer.addMenuItem("á¡éä¢","location='edit costomer.jsp'");
    menu_customer.hideOnMouseOut=false;
    menu_customer.bgColor='#CC6600';
    menu_customer.menuBorder=1;
    menu_customer.menuLiteBgColor='#FFFFFF';
    menu_customer.menuBorderBgColor='#CC6600';
    window.menu_employee = new Menu("root",55,20,"Microsoft Sans Serif",14,"#CC6600","#FFFFFF","#FFFFFF","#CC6600","center","middle",3,0,0,-5,7,true,true,true,0,true,true);
    menu_employee.addMenuItem("àÃÕÂ¡´Ù","location='view user.jsp'");
    menu_employee.addMenuItem("à¾ÔèÁ","location='AddUser.jsp'");
    menu_employee.addMenuItem("Åº","location='DelUser.jsp'");
    menu_employee.addMenuItem("á¡éä¢","location='EditUser.jsp'");
    menu_employee.hideOnMouseOut=false;
    menu_employee.bgColor='#555555';
    menu_employee.menuBorder=1;
    menu_employee.menuLiteBgColor='#FFFFFF';
    menu_employee.menuBorderBgColor='#CC6600';
    menu_employee.writeMenus();
}

var type_rice;
var unit_pack;
var pack_wieght;
var wieght;

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