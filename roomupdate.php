<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "menu";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $roomId = isset($_POST['roomId']) ? $_POST['roomId'] : $_POST['roomID'];
    $roomcode = $_POST['roomCode'];
    $roomdescription = $_POST['roomDescription'];

    $sql = "UPDATE roommaster SET RoomCode='$roomcode', RoomDescription='$roomdescription' WHERE RoomID='$roomId'";

    if (!empty($sql)) {
        if ($conn->query($sql) === TRUE) {
            echo "Update successful";
            header("Location: master.php");
            exit;
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
}

$conn->close();
?>
