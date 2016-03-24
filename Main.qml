import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.0

ApplicationWindow {
    width: 800;
    height: 600;
    
    ColumnLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 3
        spacing: 3
        Column {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter
            
            TextField {
                id: login
                objectName: "login"
                placeholderText: qsTr("Login")
                focus: true
                Layout.fillWidth: true
                onAccepted: {
                    btnSubmit.clicked()
                }
            }
            
            Button {
                id: btnSubmit
                objectName: "btnSubmit"
                text: qsTr("Login")
                Layout.fillWidth: true
                onClicked: {
                    var a = loginManger.login(login.text);
                    console.log(a);
                    loginManger.login(a); // Python recieves ''
                    if (a === "a"){
                        login.text = "SUCCESS"
                    }
                }
            }
        }
    }
}
