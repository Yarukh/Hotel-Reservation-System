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

    if (isset($_POST['modify']) && $_POST['modify'] === 'modify') {
     
        $sql = "UPDATE roommaster SET RoomCode='$roomcode', RoomDescription='$roomdescription' WHERE RoomID='$roomId'";
    } elseif (isset($_POST['submit']) && $_POST['submit'] == 'submit') {
      
        $checkSql = "SELECT * FROM roommaster WHERE RoomID='$roomId'";
        $result = $conn->query($checkSql);

        if ($result->num_rows > 0) {
            echo "Error: RoomID already exists";
        } else {
            $sql = "INSERT INTO roommaster (RoomID, RoomCode, RoomDescription) VALUES ('$roomId', '$roomcode', '$roomdescription')";
        }
    }

    if (!empty($sql)) {
        if ($conn->query($sql) === TRUE) {
            echo "Record updated/inserted successfully";
            header("Location: master.php");
            exit;
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
}

$conn->close();
?>
