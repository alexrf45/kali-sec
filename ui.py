import sys
import docker
from PyQt5.QtWidgets import QApplication, QMainWindow, QTableWidget, QTableWidgetItem, QHeaderView, QPushButton, QVBoxLayout, QHBoxLayout, QWidget


class DockerUI(QMainWindow):
    def __init__(self):
        super().__init__()

        # Initialize Docker client
        self.client = docker.from_env()

        # Set window properties
        self.setWindowTitle("Docker UI")
        self.setGeometry(100, 100, 800, 600)

        # Create main widget and layout
        main_widget = QWidget()
        main_layout = QVBoxLayout()
        main_widget.setLayout(main_layout)
        self.setCentralWidget(main_widget)

        # Create table widget for containers
        self.table = QTableWidget()
        self.table.setColumnCount(4)
        self.table.setHorizontalHeaderLabels(["ID", "Name", "Image", "Status"])
        self.table.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)
        main_layout.addWidget(self.table)

        # Create buttons for starting/stopping containers
        button_layout = QHBoxLayout()
        main_layout.addLayout(button_layout)
        start_button = QPushButton("Start")
        start_button.clicked.connect(self.start_container)
        stop_button = QPushButton("Stop")
        stop_button.clicked.connect(self.stop_container)
        button_layout.addWidget(start_button)
        button_layout.addWidget(stop_button)

        # Update table with current container information
        self.update_table()

    def update_table(self):
        # Get list of containers and update table
        containers = self.client.containers.list(all=True)
        self.table.setRowCount(len(containers))
        for i, container in enumerate(containers):
            id_item = QTableWidgetItem(container.short_id)
            name_item = QTableWidgetItem(container.name)
            image_item = QTableWidgetItem(container.image.tags[0])
            status_item = QTableWidgetItem(container.status)
            self.table.setItem(i, 0, id_item)
            self.table.setItem(i, 1, name_item)
            self.table.setItem(i, 2, image_item)
            self.table.setItem(i, 3, status_item)

    def start_container(self):
        # Start selected container
        selected_rows = self.table.selectionModel().selectedRows()
        for row in selected_rows:
            container_id = self.table.item(row.row(), 0).text()
            container = self.client.containers.get(container_id)
            container.start()
        self.update_table()

    def stop_container(self):
        # Stop selected container
        selected_rows = self.table.selectionModel().selectedRows()
        for row in selected_rows:
            container_id = self.table.item(row.row(), 0).text()
            container = self.client.containers.get(container_id)
            container.stop()
        self.update_table()


if __name__ == "__main__":
    app = QApplication(sys.argv)
    ui = DockerUI()
    ui.show()
    sys.exit(app.exec_())
