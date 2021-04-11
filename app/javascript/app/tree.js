/**
 * Handles tree structures on each new page load.
 *
 * Plays nicely with TurboLinks.
 */
import * as go from "gojs";

function getDataFor(dataType) {
    const elem = document.getElementById(dataType);
    if (!elem) {
        return elem;
    }
    const dataset = elem.dataset;

    if (!dataset) {
        return dataset;
    }
    return JSON.parse(dataset[dataType]);
}
function buildTrees() {
    buildTreesEachPage();
    window.addEventListener('turbolinks:load', buildTreesEachPage);
}

function buildTreesEachPage() {
    const dataList = []

    const parent = getDataFor('parentinfo');
    const children = getDataFor('childreninfo');

    if (!parent) {
        return;
    }
    console.log(parent.id, parent);
    parent.key = parent.id.toString();
    dataList.push(parent);
    if (children) {
        children.forEach(function (child, index) {
            child.key = child.id.toString();
            child.parent = parent.key
            dataList.push(child)
        });
    }
    console.log(dataList);
    const GOJS = go.GraphObject.make;
    const myDiagram = GOJS(go.Diagram, "children", {
        "undoManager.isEnabled": true,
        layout: GOJS(go.TreeLayout, {angle: 90, layerSpacing: 40})
    })

    function redirectTo(s) {
        window.location.pathname = "/notebooks/" + s
        // url_head = window.location.protocol + "//" + window.location.host + "/notebooks/" + s
        // console.log(url_head)
        // document.location.href = url_head
    }

    myDiagram.nodeTemplate =
        GOJS(go.Node, "Auto",
            GOJS(go.Shape, "RoundedRectangle", {fill: "#505050"}),
            GOJS(
                go.Panel, go.Panel.Vertical,
                {defaultAlignment: go.Spot.Left, margin: 4, width: 300},
                GOJS(go.TextBlock,
                    {
                        alignment: go.Spot.Center,
                        margin: 12,
                        stroke: "white",
                        font: "bold 16px sans-serif",
                        width: 300
                    },
                    new go.Binding("text", "title")),
                GOJS(go.TextBlock,
                    {
                        alignment: go.Spot.Center,
                        margin: 10,
                        stroke: "white",
                        font: "bold 16px sans-serif",
                        width: 300
                    },
                    new go.Binding("text", "short_description"),
                ),
                {
                    click: function (e, obj) {
                        redirectTo(obj.part.data.key)
                    }
                }
            )
        )

    myDiagram.linkTemplate =
        GOJS(go.Link,
            {routing: go.Link.Orthogonal, corner: 5},
            GOJS(go.Shape, {strokeWidth: 3, stroke: "#D0D0D0"})
        );

    const model = GOJS(go.TreeModel);

    model.nodeDataArray = dataList

    myDiagram.model = model
}

export {buildTrees};