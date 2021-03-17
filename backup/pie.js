HTMLWidgets.widget({

  name: 'pie',

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

        plot = new G2Plot.Pie(container, {
          data,
          angleField: attrs.angleField,
          colorField: attrs.colorField,
          radius: attrs.radius,
          color: attrs.color,
          title: {
            visible: attrs.title.titleVisible,
            text: attrs.title.text,
          },
          description: {
            visible: attrs.description.descVisible,
            text: attrs.description.text,
          },
          label: {
            visible: false,
          },
          legend: {
            visible: true,
            position: 'right-top',
          },

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