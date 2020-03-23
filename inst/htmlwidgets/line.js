HTMLWidgets.widget({

  name: 'line',

  type: 'output',

  factory: function (el, width, height) {

    // TODO: define shared variables for this instance
    const container = document.getElementById(el.id);
    const thiz = this;
    return {

      renderValue: function (x) {
        // add qt style if we are running under Qt
        if (window.navigator.userAgent.indexOf(" Qt/") > 0)
          el.className += " qt";
        // fetch data
        const data = HTMLWidgets.dataframeToD3(x.data);
        //fetch attributions
        const attrs = x.attrs;
        // var title={};
        if (x.attrs.title.style)
          title = {
            visible: x.attrs.title.titleVisible,
            text: x.attrs.title.text,
            style: {
              align: x.attrs.title.style.align
              , baseline: x.attrs.title.style.baseline
              , fill: x.attrs.title.style.fill
              , fontSize: x.attrs.title.style.fontSize
              , fontWeight: x.attrs.title.style.fontWeight
            }
          }
        else
          title = {
            visible: x.attrs.title.titleVisible,
            text: x.attrs.title.text
          };
        // var description={};
        if (x.attrs.description.style) description = {
          visible: attrs.description.descVisible,
          text: attrs.description.text,
          style: {
            align: attrs.description.style.align
            , baseline: attrs.description.style.baseline
            , fill: attrs.description.style.fill
            , fontSize: attrs.description.style.fontSize
            , fontWeight: attrs.description.style.fontWeight
          }
        }
        else
          description = {
            visible: attrs.description.descVisible,
            text: attrs.description.text,
          };
        // legend
        if (x.attrs.legend.visible == true || x.attrs.legend.visible == null) legend = x.attrs.legend
        else legend = {
          visible: false,
        };
        // guideline
        var gls = [];
        for (let i in x.attrs.gls) {
          let o = {};
          o = x.attrs.gls[i];
          gls.push(o)
        };
        // axis
        // xaxis
        if (x.attrs.xAxis) xAxis = x.attrs.xAxis
        else xAxis = { visible: true };
        //  yaxis
        if (x.attrs.yAxis) yAxis = x.attrs.yAxis
        else yAxis = { visible: true };
        // plot
        plot = new G2Plot.Line(container, {
          data,
          xField: attrs.xField,
          yField: attrs.yField,
          seriesField: attrs.seriesField,
          title,
          description,
          legend,
          guideLine: gls,
          point: {
            visible: attrs.point,
          },
          label: {
            visible: false,
          },
          xAxis,
          yAxis
        });
        // render plot
        plot.render();
      },
      resize: function (width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});