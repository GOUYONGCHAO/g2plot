HTMLWidgets.widget({

  name: 'g2matrix',

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
        const attrs = x.attrs;
        // if(attrs.forceSquare==null) attrs.forceSquare=true
        // if(attrs.shapeType==null) attrs.shapeType='rect'
        plot = new G2Plot.Matrix(container, {
          data,
          xField: attrs.xField,
          yField: attrs.yField,
          colorField: attrs.colorField,
          shapeSize: [2,20],
          // shapeType:'rect',
          // forceSquare: true,
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
          
        });
        // if(attrs.shapeSize) plot.shapeSize=attrs.shapeSize;
        // if(attrs.sizeField) plot.sizeField=attrs.sizeField; 
        // render plot
        plot.render(); 

      },


      

      resize: function (width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});