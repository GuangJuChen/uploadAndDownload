<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="head.jsp"%>
<html>
<head>
    <title>3D图</title>
    <script src="http://code.highcharts.com/highcharts-3d.js"></script>
</head>
<body>
<div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div>
<div id="sliders">
    <table>
        <tr><td>Alpha Angle</td><td><input id="R0" type="range" min="0" max="45" value="15"/> <span id="R0-value" class="value"></span></td></tr>
        <tr><td>Beta Angle</td><td><input id="R1" type="range" min="0" max="45" value="15"/> <span id="R1-value" class="value"></span></td></tr>
    </table>
</div>
<script language="JavaScript">
    $(document).ready(function() {
        var chart = {
            renderTo: 'container',
            type: 'column',
            margin: 75,
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                depth: 50,
                viewDistance: 25
            }
        };
        var title = {
            text: '图表旋转实例'
        };
        var subtitle = {
            text: '通过拖动下面的滑块测试'
        };

        var plotOptions = {
            column: {
                depth: 25
            }
        };
        var series= [{
            data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
        }];

        var json = {};
        json.chart = chart;
        json.title = title;
        json.subtitle = subtitle;
        json.series = series;
        json.plotOptions = plotOptions;
        var highchart = new Highcharts.Chart(json);

        function showValues() {
            $('#R0-value').html(highchart.options.chart.options3d.alpha);
            $('#R1-value').html(highchart.options.chart.options3d.beta);
        }

        // Activate the sliders
        $('#R0').on('change', function () {
            highchart.options.chart.options3d.alpha = this.value;
            showValues();
            highchart.redraw(false);
        });
        $('#R1').on('change', function () {
            highchart.options.chart.options3d.beta = this.value;
            showValues();
            highchart.redraw(false);
        });

        showValues();
    });
</script>
</body>
</html>
