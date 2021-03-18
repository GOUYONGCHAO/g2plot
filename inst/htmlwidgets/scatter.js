HTMLWidgets.widget({

  name: 'scatter',

  type: 'output',

  factory: function (el, width, height) {
    // TODO: define shared variables for this instance
    const container = document.getElementById(el.id);
    const thiz=this;
    return {
      renderValue: function (x) {
        // add qt style if we are running under Qt
        if (window.navigator.userAgent.indexOf(" Qt/") > 0)
          el.className += " qt";
        // fetch data
        const data = HTMLWidgets.dataframeToD3(x.data);
        //fetch attributions
        const mapping = x.mapping;
        const scatterPlot = new G2Plot.Scatter(container ,{
          data,
          xField: mapping.xField,
          yField: mapping.yField,
          colorField: mapping.colorField
        });
        // render plot
       scatterPlot.render();
      },
      resize: function (width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
