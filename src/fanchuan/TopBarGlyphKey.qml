import QtQuick 2.0
import com.jolla.keyboard 1.0
import Sailfish.Silica 1.0
import ".."
import "../.."

Item {
    id: switchCharKey
    property bool leftAlign: false
    height: Theme.itemSizeSmall
    width: height * 0.9
    Rectangle {
        id: switchbg
        width: parent.width * 0.8
        height: parent.height * 0.8
        anchors {
            left: leftAlign ? parent.left : undefined
            verticalCenter: parent.verticalCenter
        }
        color: switchButton.pressed ? Theme.highlightBackgroundColor : Theme.primaryColor
        opacity: switchButton.pressed ? 0.6 : 0.3
        radius: geometry.keyRadius

        MouseArea {
            id: switchButton
            anchors.fill: parent

            onClicked: {
                if (layoutRow.layout.inputMode === "simplified") {
                    layoutRow.layout.inputMode = "traditional"
                } else if (layoutRow.layout.inputMode === "traditional") {
                    layoutRow.layout.inputMode = "simplified"
                }
                // disables model reset
                glyphSwap = true
            }
        }
    }

    Label {
        id: switchKeyText
        height: parent.height
        width: parent.width
        anchors {
            verticalCenter: switchbg.verticalCenter
            horizontalCenter: switchbg.horizontalCenter
        }
        text: (layoutRow.layout.inputMode === "traditional" ? "简" : "繁")
        maximumLineCount: 1
        color: switchButton.pressed ? Theme.highlightColor : Theme.primaryColor
        font {
            pixelSize: Theme.fontSizeSmall
            family: Theme.fontFamily
        }
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        z: 100
    }
}