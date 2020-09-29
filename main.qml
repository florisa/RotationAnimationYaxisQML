import QtQuick 2.9
import QtQuick.Window 2.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("DragAndRotate")

    Rectangle {
        id: container
        x: 100
        y: 100
        width: 600
        height: 200

        Rectangle {
            id: myRectangle
            width: 50; height: 50
            color: "red"
            transform:
                Rotation {
                id: yRed
                origin.x: 50;
                origin.y: 50;
                axis { x: 0; y: 1; z: 0; }
                angle: 0
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        drag.target: myRectangle
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: container.width - myRectangle.width
        // Zoom in-out & drag movement
        onWheel: {
            if (wheel.modifiers & Qt.ControlModifier)
            {
                yRed.angle += (wheel.angleDelta.y/120)*5;
            }
            else
            {
                myRectangle.rotation += wheel.angleDelta.x / 120;
                if (Math.abs(myRectangle.rotation) < 0.6)
                {
                    myRectangle.rotation = 0;
                }
                var scaleBefore = myRectangle.scale;
                myRectangle.scale += myRectangle.scale * wheel.angleDelta.y / 120 / 10;
            }
        }
    }
}






