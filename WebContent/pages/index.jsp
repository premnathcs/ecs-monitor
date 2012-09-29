<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Monitoring Dashboard</title>
<meta charset="utf-8">
<title>Bootstrap, from Twitter</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="css/bootstrap.css" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}
</style>
<link href="css/bootstrap-responsive.css" rel="stylesheet">
<link href="css/datepicker.css" rel="stylesheet">
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="#">e-commerce</a>
				<div class="nav-collapse collapse">
					<ul class="nav">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#about">About</a></li>
						<li><a href="#contact">Contact</a></li>
					</ul>
					<form class="navbar-form pull-right">
						<input class="span2" type="text" placeholder="Email"> <input
							class="span2" type="password" placeholder="Password">
						<button type="submit" class="btn">Sign in</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3">
				<div class="well sidebar-nav" style="height:590px">
					<ul class="nav nav-list">
						<li class="nav-header">User Account</li>
						<li class="active"><a href="#">Link</a></li>
						<li><a href="#">Link</a></li>
						<li><a href="#">Link</a></li>
						<li><a href="#">Link</a></li>
						<li class="nav-header">Selling</li>
						<li><a href="#">Link</a></li>
						<li><a href="#">Link</a></li>
						<li><a href="#">Link</a></li>
						<li><a href="#">Link</a></li>
						<li><a href="#">Link</a></li>
						<li><a href="#">Link</a></li>
						<li class="nav-header">Buying</li>
						<li><a href="#">Link</a></li>
						<li><a href="#">Link</a></li>
						<li><a href="#">Link</a></li>
						<li class="nav-header">Trust &amp; Safety</li>
						<li><a href="#">Link</a></li>
						<li><a href="#">Link</a></li>
						<li><a href="#">Link</a></li>
					</ul>
				</div>
			</div>
			<div class="well span9">
				<div class="span6" style="margin-right: 50px;">
					<div class="alert alert-error" id="alert"
						style="margin-bottom: 0px; padding-top: 4px; padding-bottom: 4px; display: none;">
						<strong>Oh snap!</strong>
					</div>
				</div>
				<form class="form-inline" style="margin-bottom: 0px;">
					<div class="input-append date" id="date-start"
						data-date="12-02-2012" data-date-format="dd-mm-yyyy">
						<input class="span9" size="16" type="text" value="12-02-2012"
							readonly> <span class="add-on"><i class="icon-th"></i></span>
					</div>
					<div class="input-append date" id="date-end" data-date="12-02-2012"
						data-date-format="dd-mm-yyyy">
						<input class="span9" size="16" type="text" value="12-02-2012"
							readonly> <span class="add-on"><i class="icon-th"></i></span>
					</div>
					<button type="submit" class="btn btn-primary">Go</button>
				</form>
			</div>
			<div class="span9">
				<div class="hero-unit">
					<div id="linechart" style="width:100%; height:400px;"></div>
				</div>
			</div>
		</div>
		<hr>
		<footer>
			<p>� e-commerce 2012</p>
		</footer>
	</div>
	<script src="js/vendor/jquery.min.js"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/vendor/bootstrap-datepicker.js"></script>
	<script src="js/vendor/amcharts.js"></script>
	<script src="js/vendor/swfobject.js"></script>

	<script>
		$(function() {
			var startDate = new Date();
			var endDate = new Date();
			// start-date and end-date validation 
			$('#date-start')
					.datepicker()
					.on(
							'changeDate',
							function(ev) {
								if (ev.date.valueOf() > endDate.valueOf()) {
									$('#alert')
											.show()
											.find('strong')
											.text(
													'The start date must be before the end date.');
								} else {
									$('#alert').hide();
									startDate = new Date(ev.date);
									$('#date-start-display').text(
											$('#date-start').data('date'));
								}
								$('#date-start').datepicker('hide');
							});
			$('#date-end')
					.datepicker()
					.on(
							'changeDate',
							function(ev) {
								if (ev.date.valueOf() < startDate.valueOf()) {
									$('#alert')
											.show()
											.find('strong')
											.text(
													'The end date must be after the start date.');
								} else {
									$('#alert').hide();
									endDate = new Date(ev.date);
									$('#date-end-display').text(
											$('#date-end').data('date'));
								}
								$('#date-end').datepicker('hide');
							});
			
		        // create flash object to display amchart
		    	var so = new SWFObject("flash/amline/amline.swf", "amline", "780", "400", "8", "#E3E3E3");
		    	so.addVariable("path", "flash/amline/");
		    	so.addVariable("chart_settings", encodeURIComponent("<settings><font>Tahoma</font><hide_bullets_count>18</hide_bullets_count><background><alpha>13</alpha><border_alpha>10</border_alpha></background><plot_area><margins><left>50</left><right>40</right><bottom>65</bottom></margins></plot_area><grid><x><alpha>10</alpha><approx_count>9</approx_count></x><y_left><alpha>10</alpha></y_left></grid><axes><x><width>1</width><color>0D8ECF</color></x><y_left><width>1</width><color>0D8ECF</color></y_left></axes><indicator><color>0D8ECF</color><x_balloon_text_color>FFFFFF</x_balloon_text_color><line_alpha>50</line_alpha><selection_color>0D8ECF</selection_color><selection_alpha>20</selection_alpha></indicator><zoom_out_button><text_color_hover>FF0F00</text_color_hover></zoom_out_button><help><button><color>FCD202</color><text_color>000000</text_color><text_color_hover>FF0F00</text_color_hover></button><balloon><text><![CDATA[Click on the graph to turn on/off value baloon <br/><br/>Click on legend key to show/hide graph<br/><br/>Mark the area you wish to enlarge]]></text><color>FCD202</color><text_color>000000</text_color></balloon></help><graphs><graph gid='0'><title>Anomaly</title><color>0D8ECF</color><color_hover>FF0F00</color_hover><selected>true</selected></graph><graph gid='1'><title>Smoothed</title><color>B0DE09</color><color_hover>FF0F00</color_hover><selected>true</selected></graph></graphs><labels><label lid='0'><text><![CDATA[<b>Temperature anomaly</b>]]></text><y>25</y><text_size>13</text_size><align>center</align></label></labels></settings>"));
		    	so.addVariable("chart_data", encodeURIComponent("<chart><series><value xid='0'>1850</value><value xid='1'>1851</value><value xid='2'>1852</value><value xid='3'>1853</value><value xid='4'>1854</value><value xid='5'>1855</value><value xid='6'>1856</value><value xid='7'>1857</value><value xid='8'>1858</value><value xid='9'>1859</value><value xid='10'>1860</value><value xid='11'>1861</value><value xid='12'>1862</value><value xid='13'>1863</value><value xid='14'>1864</value><value xid='15'>1865</value><value xid='16'>1866</value><value xid='17'>1867</value><value xid='18'>1868</value><value xid='19'>1869</value><value xid='20'>1870</value><value xid='21'>1871</value><value xid='22'>1872</value><value xid='23'>1873</value><value xid='24'>1874</value><value xid='25'>1875</value><value xid='26'>1876</value><value xid='27'>1877</value><value xid='28'>1878</value><value xid='29'>1879</value><value xid='30'>1880</value><value xid='31'>1881</value><value xid='32'>1882</value><value xid='33'>1883</value><value xid='34'>1884</value><value xid='35'>1885</value><value xid='36'>1886</value><value xid='37'>1887</value><value xid='38'>1888</value><value xid='39'>1889</value><value xid='40'>1890</value><value xid='41'>1891</value><value xid='42'>1892</value><value xid='43'>1893</value><value xid='44'>1894</value><value xid='45'>1895</value><value xid='46'>1896</value><value xid='47'>1897</value><value xid='48'>1898</value><value xid='49'>1899</value><value xid='50'>1900</value><value xid='51'>1901</value><value xid='52'>1902</value><value xid='53'>1903</value><value xid='54'>1904</value><value xid='55'>1905</value><value xid='56'>1906</value><value xid='57'>1907</value><value xid='58'>1908</value><value xid='59'>1909</value><value xid='60'>1910</value><value xid='61'>1911</value><value xid='62'>1912</value><value xid='63'>1913</value><value xid='64'>1914</value><value xid='65'>1915</value><value xid='66'>1916</value><value xid='67'>1917</value><value xid='68'>1918</value><value xid='69'>1919</value><value xid='70'>1920</value><value xid='71'>1921</value><value xid='72'>1922</value><value xid='73'>1923</value><value xid='74'>1924</value><value xid='75'>1925</value><value xid='76'>1926</value><value xid='77'>1927</value><value xid='78'>1928</value><value xid='79'>1929</value><value xid='80'>1930</value><value xid='81'>1931</value><value xid='82'>1932</value><value xid='83'>1933</value><value xid='84'>1934</value><value xid='85'>1935</value><value xid='86'>1936</value><value xid='87'>1937</value><value xid='88'>1938</value><value xid='89'>1939</value><value xid='90'>1940</value><value xid='91'>1941</value><value xid='92'>1942</value><value xid='93'>1943</value><value xid='94'>1944</value><value xid='95'>1945</value><value xid='96'>1946</value><value xid='97'>1947</value><value xid='98'>1948</value><value xid='99'>1949</value><value xid='100'>1950</value><value xid='101'>1951</value><value xid='102'>1952</value><value xid='103'>1953</value><value xid='104'>1954</value><value xid='105'>1955</value><value xid='106'>1956</value><value xid='107'>1957</value><value xid='108'>1958</value><value xid='109'>1959</value><value xid='110'>1960</value><value xid='111'>1961</value><value xid='112'>1962</value><value xid='113'>1963</value><value xid='114'>1964</value><value xid='115'>1965</value><value xid='116'>1966</value><value xid='117'>1967</value><value xid='118'>1968</value><value xid='119'>1969</value><value xid='120'>1970</value><value xid='121'>1971</value><value xid='122'>1972</value><value xid='123'>1973</value><value xid='124'>1974</value><value xid='125'>1975</value><value xid='126'>1976</value><value xid='127'>1977</value><value xid='128'>1978</value><value xid='129'>1979</value><value xid='130'>1980</value><value xid='131'>1981</value><value xid='132'>1982</value><value xid='133'>1983</value><value xid='134'>1984</value><value xid='135'>1985</value><value xid='136'>1986</value><value xid='137'>1987</value><value xid='138'>1988</value><value xid='139'>1989</value><value xid='140'>1990</value><value xid='141'>1991</value><value xid='142'>1992</value><value xid='143'>1993</value><value xid='144'>1994</value><value xid='145'>1995</value><value xid='146'>1996</value><value xid='147'>1997</value><value xid='148'>1998</value><value xid='149'>1999</value><value xid='150'>2000</value><value xid='151'>2001</value><value xid='152'>2002</value><value xid='153'>2003</value><value xid='154'>2004</value><value xid='155'>2005</value></series><graphs><graph gid='1'><value xid='0'>-0.362</value><value xid='1'>-0.359</value><value xid='2'>-0.358</value><value xid='3'>-0.362</value><value xid='4'>-0.368</value><value xid='5'>-0.377</value><value xid='6'>-0.388</value><value xid='7'>-0.398</value><value xid='8'>-0.405</value><value xid='9'>-0.409</value><value xid='10'>-0.409</value><value xid='11'>-0.406</value><value xid='12'>-0.398</value><value xid='13'>-0.387</value><value xid='14'>-0.374</value><value xid='15'>-0.360</value><value xid='16'>-0.347</value><value xid='17'>-0.335</value><value xid='18'>-0.327</value><value xid='19'>-0.321</value><value xid='20'>-0.317</value><value xid='21'>-0.315</value><value xid='22'>-0.312</value><value xid='23'>-0.307</value><value xid='24'>-0.297</value><value xid='25'>-0.285</value><value xid='26'>-0.271</value><value xid='27'>-0.258</value><value xid='28'>-0.249</value><value xid='29'>-0.246</value><value xid='30'>-0.249</value><value xid='31'>-0.259</value><value xid='32'>-0.272</value><value xid='33'>-0.287</value><value xid='34'>-0.301</value><value xid='35'>-0.314</value><value xid='36'>-0.326</value><value xid='37'>-0.337</value><value xid='38'>-0.348</value><value xid='39'>-0.359</value><value xid='40'>-0.370</value><value xid='41'>-0.379</value><value xid='42'>-0.383</value><value xid='43'>-0.383</value><value xid='44'>-0.378</value><value xid='45'>-0.369</value><value xid='46'>-0.359</value><value xid='47'>-0.351</value><value xid='48'>-0.348</value><value xid='49'>-0.352</value><value xid='50'>-0.362</value><value xid='51'>-0.376</value><value xid='52'>-0.395</value><value xid='53'>-0.414</value><value xid='54'>-0.434</value><value xid='55'>-0.452</value><value xid='56'>-0.468</value><value xid='57'>-0.480</value><value xid='58'>-0.489</value><value xid='59'>-0.492</value><value xid='60'>-0.488</value><value xid='61'>-0.478</value><value xid='62'>-0.462</value><value xid='63'>-0.443</value><value xid='64'>-0.424</value><value xid='65'>-0.407</value><value xid='66'>-0.392</value><value xid='67'>-0.378</value><value xid='68'>-0.366</value><value xid='69'>-0.355</value><value xid='70'>-0.345</value><value xid='71'>-0.334</value><value xid='72'>-0.322</value><value xid='73'>-0.310</value><value xid='74'>-0.298</value><value xid='75'>-0.285</value><value xid='76'>-0.272</value><value xid='77'>-0.258</value><value xid='78'>-0.246</value><value xid='79'>-0.233</value><value xid='80'>-0.219</value><value xid='81'>-0.205</value><value xid='82'>-0.189</value><value xid='83'>-0.172</value><value xid='84'>-0.151</value><value xid='85'>-0.128</value><value xid='86'>-0.103</value><value xid='87'>-0.078</value><value xid='88'>-0.054</value><value xid='89'>-0.035</value><value xid='90'>-0.023</value><value xid='91'>-0.018</value><value xid='92'>-0.022</value><value xid='93'>-0.033</value><value xid='94'>-0.052</value><value xid='95'>-0.076</value><value xid='96'>-0.102</value><value xid='97'>-0.126</value><value xid='98'>-0.147</value><value xid='99'>-0.162</value><value xid='100'>-0.171</value><value xid='101'>-0.175</value><value xid='102'>-0.176</value><value xid='103'>-0.174</value><value xid='104'>-0.169</value><value xid='105'>-0.162</value><value xid='106'>-0.151</value><value xid='107'>-0.139</value><value xid='108'>-0.125</value><value xid='109'>-0.114</value><value xid='110'>-0.106</value><value xid='111'>-0.104</value><value xid='112'>-0.108</value><value xid='113'>-0.114</value><value xid='114'>-0.120</value><value xid='115'>-0.125</value><value xid='116'>-0.127</value><value xid='117'>-0.125</value><value xid='118'>-0.120</value><value xid='119'>-0.114</value><value xid='120'>-0.108</value><value xid='121'>-0.104</value><value xid='122'>-0.100</value><value xid='123'>-0.097</value><value xid='124'>-0.091</value><value xid='125'>-0.082</value><value xid='126'>-0.068</value><value xid='127'>-0.050</value><value xid='128'>-0.028</value><value xid='129'>-0.006</value><value xid='130'>0.015</value><value xid='131'>0.032</value><value xid='132'>0.046</value><value xid='133'>0.058</value><value xid='134'>0.069</value><value xid='135'>0.081</value><value xid='136'>0.094</value><value xid='137'>0.108</value><value xid='138'>0.123</value><value xid='139'>0.137</value><value xid='140'>0.150</value><value xid='141'>0.163</value><value xid='142'>0.178</value><value xid='143'>0.195</value><value xid='144'>0.216</value><value xid='145'>0.241</value><value xid='146'>0.268</value><value xid='147'>0.296</value><value xid='148'>0.323</value><value xid='149'>0.348</value><value xid='150'>0.370</value><value xid='151'>0.389</value><value xid='152'>0.404</value><value xid='153'>0.415</value><value xid='154'>0.422</value><value xid='155'>0.426</value></graph><graph gid='0'><value xid='0'>-0.447</value><value xid='1'>-0.292</value><value xid='2'>-0.294</value><value xid='3'>-0.336</value><value xid='4'>-0.308</value><value xid='5'>-0.323</value><value xid='6'>-0.405</value><value xid='7'>-0.502</value><value xid='8'>-0.512</value><value xid='9'>-0.347</value><value xid='10'>-0.372</value><value xid='11'>-0.416</value><value xid='12'>-0.542</value><value xid='13'>-0.309</value><value xid='14'>-0.505</value><value xid='15'>-0.292</value><value xid='16'>-0.292</value><value xid='17'>-0.325</value><value xid='18'>-0.287</value><value xid='19'>-0.310</value><value xid='20'>-0.299</value><value xid='21'>-0.341</value><value xid='22'>-0.253</value><value xid='23'>-0.328</value><value xid='24'>-0.394</value><value xid='25'>-0.415</value><value xid='26'>-0.402</value><value xid='27'>-0.089</value><value xid='28'>0.025</value><value xid='29'>-0.263</value><value xid='30'>-0.259</value><value xid='31'>-0.242</value><value xid='32'>-0.245</value><value xid='33'>-0.296</value><value xid='34'>-0.380</value><value xid='35'>-0.361</value><value xid='36'>-0.274</value><value xid='37'>-0.386</value><value xid='38'>-0.336</value><value xid='39'>-0.191</value><value xid='40'>-0.430</value><value xid='41'>-0.379</value><value xid='42'>-0.482</value><value xid='43'>-0.504</value><value xid='44'>-0.440</value><value xid='45'>-0.418</value><value xid='46'>-0.208</value><value xid='47'>-0.242</value><value xid='48'>-0.430</value><value xid='49'>-0.311</value><value xid='50'>-0.220</value><value xid='51'>-0.300</value><value xid='52'>-0.430</value><value xid='53'>-0.507</value><value xid='54'>-0.553</value><value xid='55'>-0.411</value><value xid='56'>-0.328</value><value xid='57'>-0.507</value><value xid='58'>-0.559</value><value xid='59'>-0.564</value><value xid='60'>-0.547</value><value xid='61'>-0.580</value><value xid='62'>-0.490</value><value xid='63'>-0.489</value><value xid='64'>-0.304</value><value xid='65'>-0.213</value><value xid='66'>-0.434</value><value xid='67'>-0.505</value><value xid='68'>-0.384</value><value xid='69'>-0.327</value><value xid='70'>-0.313</value><value xid='71'>-0.262</value><value xid='72'>-0.381</value><value xid='73'>-0.346</value><value xid='74'>-0.360</value><value xid='75'>-0.274</value><value xid='76'>-0.162</value><value xid='77'>-0.252</value><value xid='78'>-0.255</value><value xid='79'>-0.376</value><value xid='80'>-0.164</value><value xid='81'>-0.124</value><value xid='82'>-0.154</value><value xid='83'>-0.296</value><value xid='84'>-0.158</value><value xid='85'>-0.183</value><value xid='86'>-0.152</value><value xid='87'>-0.033</value><value xid='88'>0.009</value><value xid='89'>0.000</value><value xid='90'>0.020</value><value xid='91'>0.079</value><value xid='92'>-0.029</value><value xid='93'>-0.025</value><value xid='94'>0.122</value><value xid='95'>-0.002</value><value xid='96'>-0.204</value><value xid='97'>-0.196</value><value xid='98'>-0.203</value><value xid='99'>-0.210</value><value xid='100'>-0.307</value><value xid='101'>-0.168</value><value xid='102'>-0.073</value><value xid='103'>-0.027</value><value xid='104'>-0.251</value><value xid='105'>-0.281</value><value xid='106'>-0.348</value><value xid='107'>-0.074</value><value xid='108'>-0.011</value><value xid='109'>-0.074</value><value xid='110'>-0.124</value><value xid='111'>-0.024</value><value xid='112'>-0.022</value><value xid='113'>0.000</value><value xid='114'>-0.296</value><value xid='115'>-0.217</value><value xid='116'>-0.147</value><value xid='117'>-0.150</value><value xid='118'>-0.160</value><value xid='119'>-0.011</value><value xid='120'>-0.068</value><value xid='121'>-0.190</value><value xid='122'>-0.056</value><value xid='123'>0.077</value><value xid='124'>-0.213</value><value xid='125'>-0.170</value><value xid='126'>-0.254</value><value xid='127'>0.019</value><value xid='128'>-0.063</value><value xid='129'>0.050</value><value xid='130'>0.077</value><value xid='131'>0.120</value><value xid='132'>0.011</value><value xid='133'>0.177</value><value xid='134'>-0.021</value><value xid='135'>-0.037</value><value xid='136'>0.030</value><value xid='137'>0.179</value><value xid='138'>0.180</value><value xid='139'>0.104</value><value xid='140'>0.255</value><value xid='141'>0.210</value><value xid='142'>0.065</value><value xid='143'>0.110</value><value xid='144'>0.172</value><value xid='145'>0.269</value><value xid='146'>0.141</value><value xid='147'>0.353</value><value xid='148'>0.548</value><value xid='149'>0.298</value><value xid='150'>0.267</value><value xid='151'>0.411</value><value xid='152'>0.462</value><value xid='153'>0.470</value><value xid='154'>0.445</value><value xid='155'>0.470</value></graph></graphs></chart>"));
		    	so.write("linechart");
		});
	</script>
</body>
</html>