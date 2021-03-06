HTMLWidgets.widget({

  name: 'stock',

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
        const stockPlot = new G2Plot.Stock(container ,{
          data,
          appendPadding: 30,
          xField: mapping.xField,
          //
          //yField: ['open', 'close', 'high', 'low'],
          yField:mapping.yField,
          colorField: mapping.colorField,
          color:mapping.color,
          theme:x.theme,
          label:x.label,
          theme:x.theme,
           // label
           label:{  formatter: (item) => {
            return item[mapping.label]}
                },
          xAxis:x.xAxis,
          yAxis:x.yAxis,
          legend:x.legend,
           // tooltip
           tooltip:x.tooltip,
            //annotations
          annotations:x.annotations,
          });
        // render plot
       stockPlot.render();
      },

      resize: function (width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
