HTMLWidgets.widget({

  name: 'heatmap',

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
        const heatmapPlot = new G2Plot.Heatmap(container ,{
          data,
          appendPadding: 30,
          xField: mapping.xField,
          yField: mapping.yField,
          colorField: mapping.colorField,
          color:mapping.color,
          sizeField:mapping.sizeField,
          size:mapping.size,
          seriesField:mapping.seriesField,
          meta:x.meta,
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
        heatmapPlot.render();
      },

      resize: function (width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
