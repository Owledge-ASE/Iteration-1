dataList = []
let parent = $('.parentinfo').data('parentinfo')
let children = $('.childreninfo').data('childreninfo')
if(parent){
  parent.key = parent.id.toString()
  dataList.push(parent)
  if(children){
    children.forEach(function (child, index){
      child.key = child.id.toString(); 
      child.parent = parent.key
      dataList.push(child)
    })
  }
}

console.log(dataList)


var GOJS = go.GraphObject.make;
var myDiagram = GOJS(go.Diagram, "children", {
    "undoManager.isEnabled":true,
    layout: GOJS(go.TreeLayout, {angle: 90, layerSpacing: 40})
})
function redirectTo(s) {
    window.location.pathname = "/notebooks/"+s
    // url_head = window.location.protocol + "//" + window.location.host + "/notebooks/" + s
    // console.log(url_head)
    // document.location.href = url_head
}
myDiagram.nodeTemplate  = 
    GOJS(go.Node, "Auto",
        GOJS(go.Shape, "RoundedRectangle", {fill: "#505050"}),
        GOJS(
            go.Panel, go.Panel.Vertical,
            { defaultAlignment: go.Spot.Left, margin: 4},
            GOJS(  go.TextBlock,
                {alignment: go.Spot.Center ,margin:12, stroke: "white", font: "bold 16px sans-serif" },
                new go.Binding("text", "title")),
            GOJS(  go.TextBlock,
                { alignment: go.Spot.Center, margin:10, stroke: "white", font: "bold 16px sans-serif" },
                new go.Binding("text", "description"),
            ),
            {
                click: function(e, obj) { redirectTo(obj.part.data.key) }
            }
        )
    )

myDiagram.linkTemplate = 
    GOJS(go.Link,
        {routing: go.Link.Orthogonal, corner:5},
        GOJS(go.Shape, { strokeWidth: 3, stroke: "#D0D0D0"})
    );

var model = GOJS(go.TreeModel);

model.nodeDataArray = dataList

myDiagram.model = model
