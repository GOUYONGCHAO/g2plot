HTMLWidgets.widget({

  name: 'rose',

  type: 'output',

  factory: function (el, width, height) {

    // TODO: define shared variables for this instance
    const container = document.getElementById(el.id);
    return {
      renderValue: function (x) {
        // add qt style if we are running under Qt
        if (window.navigator.userAgent.indexOf(" Qt/") > 0)
          el.className += " qt";
        // fetch data
        const data = HTMLWidgets.dataframeToD3(x.data);
        //fetch attributions
      plot = new G2Plot.Rose(container, {
          data,
          radiusField: x.attrs.radiusField,
          categoryField: x.attrs.catagoryField,
          colorField: x.attrs.colorField,
          radius: x.attrs.radius,
          width: x.attrs.width,
          height: x.attrs.height,
          forceFit: x.attrs.forceFit,
          pixelRatio:x.attrs.pixelRatio,
          // color:attrs.color,
          // sectorStyle:attrs.sectorStyle,
          // title: {
          //   visible: attrs.title.titleVisible,
          //   text: attrs.title.text,
          // },
          // description: {
          //   visible: attrs.description.descVisible,
          //   text: attrs.description.text,
          // // },
          // label: {
          //   visible: false,
          // },
          // xAxis: {
          //   visible: true,
          //   min: -5,
          // },
          // legend: {
          //   visible: true,
          //   position: 'right-top',
          // },
          
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