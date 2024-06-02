<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sample Bill</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        #container {
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 90%;
            margin: 20px auto;
        }

        #container table {
            width: 100%;
            border-collapse: collapse;
        }

        #container th,
        #container td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        #container th {
            background-color: #4CAF50;
            color: #ffffff;
        }

        #container tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>

<body>
    <div id="sidebar"></div>
    <div id="container">
        <?php
        // Enable error reporting for debugging
        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);

        // Database connection parameters
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "menu";

        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);

        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // Validate and sanitize input ID
        if (isset($_GET['id']) && is_numeric($_GET['id'])) {
            $id = intval($_GET['id']);

            // Prepare SQL statement to prevent SQL injection
            $sql = "SELECT id, checkInDate, checkOutDate, guestTitle, guestName, roomNumber, roomType, plan FROM booking WHERE id = ?";
            $stmt = $conn->prepare($sql);

            if ($stmt) {
                $stmt->bind_param("i", $id);
                $stmt->execute();
                $result = $stmt->get_result();

                if ($result->num_rows > 0) {
                    echo "<table>
                            <tr>
                                <th>ID</th>
                                <th>Check-In Date</th>
                                <th>Check-Out Date</th>
                                <th>Guest Title</th>
                                <th>Guest Name</th>
                                <th>Room Number</th>
                                <th>Room Type</th>
                                <th>Plan</th>
                            </tr>";
                    while ($row = $result->fetch_assoc()) {
                        // Sanitize output to prevent XSS attacks
                        echo "<tr>
                                <td>" . htmlspecialchars($row['id']) . "</td>
                                <td>" . htmlspecialchars($row['checkInDate']) . "</td>
                                <td>" . htmlspecialchars($row['checkOutDate']) . "</td>
                                <td>" . htmlspecialchars($row['guestTitle']) . "</td>
                                <td>" . htmlspecialchars($row['guestName']) . "</td>
                                <td>" . htmlspecialchars($row['roomNumber']) . "</td>
                                <td>" . htmlspecialchars($row['roomType']) . "</td>
                                <td>" . htmlspecialchars($row['plan']) . "</td>
                            </tr>";
                    }
                    echo "</table>";
                } else {
                    echo "No records found for the given ID";
                }
                $stmt->close();
            } else {
                echo "Error preparing statement: " . $conn->error;
            }
        } else {
            echo "<p>No valid ID provided.</p>";
        }
        $conn->close();
        ?>
    </div>
    <script>
        function includeContent(url, targetId) {
            fetch(url)
                .then(response => response.text())
                .then(data => {
                    document.getElementById(targetId).innerHTML = data;
                })
                .catch(error => {
                    console.error('Error loading content:', error);
                });
        }
        includeContent('menu.html', 'sidebar');
    </script>
</body>

</html>
