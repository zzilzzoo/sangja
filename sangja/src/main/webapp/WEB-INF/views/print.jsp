<!DOCTYPE html>
<html>

  <head>
    <script data-require="jquery@*" data-semver="3.2.1" src="https://cdn.jsdelivr.net/npm/jquery@3.2.1/dist/jquery.min.js"></script>
    
    <script src="../resources/js/BrowserPrint.js"></script>
   <script src="../resources/js/DevDemo.js"></script>
   
   <script type="text/javascript">
    $(document).ready(setup_web_print);
	</script>
  </head>

  <body style="background-color:#D8D8D8; font-size:24px;">

	<div class="container" style="width:500px">
		<div id="main">
			<div id="printer_data_loading" style="display:none"><span id="loading_message">Loading Printer Details...</span><br/>
        <div class="progress" style="width:100%">
          <div class="progress-bar progress-bar-striped active"  role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
          </div>
        </div>
      </div> <!-- /printer_data_loading -->
      <div id="printer_details" style="display:none">
        <span id="selected_printer">No data</span> 
        <button type="button" class="btn btn-success" onclick="changePrinter()">Change</button>
      </div><br /> <!-- /printer_details -->
      <div id="printer_select" style="display:none">
        Zebra Printer Options<br />
        Printer: <select id="printers"></select>
      </div> <!-- /printer_select -->
      <div id="print_form" style="display:none">
        Enter Name: <input type="text" id="entered_name" />
        <br /><br />
        <button type="button" class="btn btn-lg btn-primary" onclick="sendData();" value="Print">Print Label</button>
      </div> <!-- /print_form -->
    </div> <!-- /main -->
    <div id="error_div" style="width:500px; display:none"><div id="error_message"></div>
      <button type="button" class="btn btn-lg btn-success" onclick="trySetupAgain();">Try Again</button>
    </div><!-- /error_div -->
	</div><!-- /container -->

</html>
