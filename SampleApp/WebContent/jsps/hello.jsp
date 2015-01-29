<html >
<head>
    <title id='Description'>This example shows how to create a Grid from Array data.</title>
    <script type="text/javascript" src="<%=pageContext.getServletContext().getContextPath()%>/js/scripts/test.js"></script>
    <link rel="stylesheet" href="<%=pageContext.getServletContext().getContextPath()%>/js/jqwidgets/styles/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="<%=pageContext.getServletContext().getContextPath()%>/js/scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="<%=pageContext.getServletContext().getContextPath()%>/js/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="<%=pageContext.getServletContext().getContextPath()%>/js/jqwidgets/jqxdata.js"></script>
    <script type="text/javascript" src="<%=pageContext.getServletContext().getContextPath()%>/js/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="<%=pageContext.getServletContext().getContextPath()%>/js/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="<%=pageContext.getServletContext().getContextPath()%>/js/jqwidgets/jqxmenu.js"></script>
    <script type="text/javascript" src="<%=pageContext.getServletContext().getContextPath()%>/js/jqwidgets/jqxgrid.js"></script>
    <script type="text/javascript" src="<%=pageContext.getServletContext().getContextPath()%>/js/jqwidgets/jqxgrid.selection.js"></script>
    <script type="text/javascript" src="<%=pageContext.getServletContext().getContextPath()%>/js/jqwidgets/jqxgrid.sort.js"></script>
    <script>
    		
    jQuery.noConflict();
    </script>
    <script type="text/javascript">
    	   	
        jQuery(document).ready(function () {
             // prepare the data
            var data = new Array();
            var firstNames =
            [
                "Andrew", "Nancy", "Shelley", "Regina", "Yoshi", "Antoni", "Mayumi", "Ian", "Peter", "Lars", "Petra", "Martin", "Sven", "Elio", "Beate", "Cheryl", "Michael", "Guylene"
            ];
            var lastNames =
            [
                "Fuller", "Davolio", "Burke", "Murphy", "Nagase", "Saavedra", "Ohno", "Devling", "Wilson", "Peterson", "Winkler", "Bein", "Petersen", "Rossi", "Vileid", "Saylor", "Bjorn", "Nodier"
            ];
            var productNames =
            [
                "Black Tea", "Green Tea", "Caffe Espresso", "Doubleshot Espresso", "Caffe Latte", "White Chocolate Mocha", "Cramel Latte", "Caffe Americano", "Cappuccino", "Espresso Truffle", "Espresso con Panna", "Peppermint Mocha Twist"
            ];
            var priceValues =
            [
                "2.25", "1.5", "3.0", "3.3", "4.5", "3.6", "3.8", "2.5", "5.0", "1.75", "3.25", "4.0"
            ];
            for (var i = 0; i < 100; i++) {
                var row = {};
                var productindex = Math.floor(Math.random() * productNames.length);
                var price = parseFloat(priceValues[productindex]);
                var quantity = 1 + Math.round(Math.random() * 10);
                row["index"] = i;
                row["firstname"] = firstNames[Math.floor(Math.random() * firstNames.length)];
                row["lastname"] = lastNames[Math.floor(Math.random() * lastNames.length)];
                row["productname"] = productNames[productindex];
                row["price"] = price;
                row["quantity"] = quantity;
                row["total"] = price * quantity;
               
                data[i] = row;
            }
            var source =
            {
                localdata: data,
                datatype: "array"
            };
            var dataAdapter = new jQuery.jqx.dataAdapter(source, {
                loadComplete: function (data) { },
                loadError: function (xhr, status, error) { }      
            });
            jQuery("#jqxgrid").jqxGrid(
            {
                source: dataAdapter,
                sortable:true,
                columns: [
					{ text: 'Row', datafield: 'index', width: 50 },
                  { text: 'First Name', datafield: 'firstname', width: 100 },
                  { text: 'Last Name', datafield: 'lastname', width: 100 },
                  { text: 'Product', datafield: 'productname', width: 180 },
                  { text: 'Quantity', datafield: 'quantity', width: 80, cellsalign: 'right' },
                  { text: 'Unit Price', datafield: 'price', width: 90, cellsalign: 'right', cellsformat: 'c2' },
                  { text: 'Total', datafield: 'total', width: 100, cellsalign: 'right', cellsformat: 'c2' }
                ]
            }); 
        });
    </script>
</head>
<body class='default' onload="sayHello();">
    <div id='jqxWidget' style="font-size: 13px; font-family: Verdana; float: left;">
        <div id="jqxgrid"></div>
    </div>
    <button onclick="sayHello();" value="Submit" ></button>
</body>
</html>