function mmLoadMenus() {
    if (window.mm_menu_0120150134_0) return;
    window.mm_menu_0120150134_0 = new Menu("root",55,20,"Microsoft Sans Serif",14,"#CC6600","#FFFFFF","#FFFFFF","#CC6600","center","middle",3,0,0,-5,7,true,true,true,0,true,true);
    mm_menu_0120150134_0.addMenuItem("àÃÕÂ¡´Ù","location='view costomer.jsp'");
    mm_menu_0120150134_0.addMenuItem("à¾ÔèÁ","location='add costomer.jsp'");
    mm_menu_0120150134_0.addMenuItem("á¡éä¢","location='edit costomer.jsp'");
    mm_menu_0120150134_0.hideOnMouseOut=false;
    mm_menu_0120150134_0.bgColor='#CC6600';
    mm_menu_0120150134_0.menuBorder=1;
    mm_menu_0120150134_0.menuLiteBgColor='#FFFFFF';
    mm_menu_0120150134_0.menuBorderBgColor='#CC6600';
    window.mm_menu_0121162302_0 = new Menu("root",55,20,"Microsoft Sans Serif",14,"#CC6600","#FFFFFF","#FFFFFF","#CC6600","center","middle",3,0,0,-5,7,true,true,true,0,true,true);
    mm_menu_0121162302_0.addMenuItem("àÃÕÂ¡´Ù","location='view user.jsp'");
    mm_menu_0121162302_0.addMenuItem("à¾ÔèÁ","location='AddUser.jsp'");
    mm_menu_0121162302_0.addMenuItem("Åº","location='DelUser.jsp'");
    mm_menu_0121162302_0.addMenuItem("á¡éä¢","location='EditUser.jsp'");
    mm_menu_0121162302_0.hideOnMouseOut=false;
    mm_menu_0121162302_0.bgColor='#555555';
    mm_menu_0121162302_0.menuBorder=1;
    mm_menu_0121162302_0.menuLiteBgColor='#FFFFFF';
    mm_menu_0121162302_0.menuBorderBgColor='#CC6600';
    mm_menu_0121162302_0.writeMenus();
}

var type_rice;
var pack_wieght;
var wieght;

function select_type_rice(type){
    type_rice = price[type];
}

function select_type_pack(type){
    pack_wieght = pack[type];
}

function caculate(){
    var form = $('c');
    var text = form.getInputs('text');
    setTimeout('checkValidat()',3000);
    if(Number(text[2].value)!=0){
        var wiegths  =  Number(text[1].value);
        text[3].value = Number(text[1].value) - Number(text[2].value);
        text[5].value = Number(text[4].value)*Number(text[3].value);
    }else {}
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