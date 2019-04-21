import QtQuick 2.0
import com.jolla.keyboard 1.0
import Sailfish.Silica 1.0
import ".."
import "../.."

Item {
    id: switchCharKey
    height: Theme.itemSizeSmall
    width: height * 0.7
    Rectangle {
        id: switchbg
        anchors {
            fill: parent
            topMargin: Theme.paddingMedium
            bottomMargin: Theme.paddingMedium
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
        text: (layoutRow.layout.inputMode === "traditional" ? "繁" : "简")
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