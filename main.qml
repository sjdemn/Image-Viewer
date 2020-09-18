import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Image Viewer")

    background: Rectangle{
        color: "darkGray"
    }

    FileDialog {
            id: fileOpenDialog
            title: "Select an image file"
            folder: shortcuts.documents
            nameFilters: [
                "Image files (*.png *.jpeg *.jpg)"
            ]
            onAccepted: {
                image.source = fileOpenDialog.fileUrl
            }
        }

    menuBar: MenuBar {
            Menu {
                title: qsTr("&File")
                MenuItem {
                    text: qsTr("&Open...")
                    icon.name: "document-open"
                    onTriggered: fileOpenDialog.open()
                }
            }

            Menu {
                title: qsTr("&Help")
                MenuItem {
                    text: qsTr("&About...")
                    onTriggered: aboutDialog.open()
                }
            }
        }

    Dialog {
        id: aboutDialog
        title: qsTr("About")
        Label {
            anchors.fill: parent
            text: qsTr("QML Image Viewer\nA part of the QmlBook\nhttp://qmlbook.org")
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Image{
        id:image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }

}
