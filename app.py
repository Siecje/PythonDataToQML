import sys
from PyQt5.QtCore import QObject, pyqtSlot
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import QQmlApplicationEngine


class InPython(QObject):
    @pyqtSlot(str, )
    def login(self, Login):
        print(Login)
        return "a"


if __name__ == "__main__":
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()
    context = engine.rootContext()
    context.setContextProperty("main", engine)
    engine.load('Main.qml')
    win = engine.rootObjects()[0]
    
    inPython = InPython()
    context.setContextProperty("loginManger", inPython)
    
    win.show()
    sys.exit(app.exec_())
