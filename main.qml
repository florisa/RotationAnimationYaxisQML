import QtQuick 2.14
import QtQuick.Window 2.14

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("DragAndRotate")

    Rectangle {
        id: container
        color: "light grey"
        anchors.centerIn: parent
        width: 600
        height: 400

        Rectangle {
            id: myRectangle
            width: 160; height: 100
            border.color: "#E4EAD4"
            border.width: 3
            x: 245
            y: 130
            color: "#83A8D2"
            opacity: 0.6
            //radius: 15
            transform:
                Rotation {
                id: yRed
                axis { x: 0; y: 1; z: 0; }
                angle: 0
            }

            Image {
                id: logo
                source: "images/inlevel_Logo"
                anchors.fill: parent
                //fillMode: Image.PreserveAspectFit
            }
        }

        Text {
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 10
            color: "grey"
            wrapMode: Text.WordWrap
            font.pointSize: 8
            text: "With a mouse: drag normally, use the vertical wheel to zoom,
horizontal wheel to rotate, or hold Ctrl while using the vertical wheel to rotate"
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






