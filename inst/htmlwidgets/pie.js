HTMLWidgets.widget({

  name: 'pie',

  type: 'output',

  factory: function (el, width, height) {
    // TODO: define shared variables for this instance
    const container = document.getElementById(el.id);
    const thiz=this;
   // console.log(this);
    return {
      renderValue: function (x) {
        // add qt style if we are running under Qt
        if (window.navigator.userAgent.indexOf(" Qt/") > 0)
          el.className += " qt";
        // fetch data
        const data = HTMLWidgets.dataframeToD3(x.data);

        //fetch attributions
        const mapping = x.mapping;
        const piePlot = new G2Plot.Pie(container ,{
          data,
          appendPadding: 30,
          angleField: mapping.xField,
         // yField: mapping.yField,
          colorField: mapping.colorField,
          color:mapping.color,
          sizeField:mapping.sizeField,
          size:mapping.size,
          seriesField:mapping.seriesField,
          radius:x.style.radius,
          innerRadius:x.style.inneradius,
          startAngle:x.style.startangle,
          endAngle:x.style.endangle,
          theme:x.theme,
          label:x.label,
          xAxis:x.xAxis,
          yAxis:x.yAxis,
          legend:x.legend,
           // tooltip
           tooltip:x.tooltip,
            //annotations
          annotations:x.annotations,
          });
        // render plot
      piePlot.render();
      },

      resize: function (width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
