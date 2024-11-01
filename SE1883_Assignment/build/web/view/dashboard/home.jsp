<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Company</title>
    <style>
        /* Basic styling for the page */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 24px;
        }
        nav {
            display: flex;
            justify-content: center;
            background-color: #333;
        }
        nav a {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            text-align: center;
        }
        nav a:hover {
            background-color: #ddd;
            color: black;
        }
        .content {
            flex: 1;
            padding: 20px;
        }
        .footer {
            background-color: #f1f1f1;
            padding: 20px;
            text-align: center;
        }
        .product-images img {
            width: 150px;
            margin: 10px;
        }
    </style>
</head>
<body>

    <header>
        ABC Company
    </header>

    <nav>
        <a href="#home">Home</a>
        <a href="#worker-management">Worker Management</a>
        <a href="#production-planning">Production Planning Management</a>
        <a href="#accounting">Accounting</a>
        <a href="#reports">Reports</a>
    </nav>

    <div class="content">
        <h1>Welcome to ABC Company's Production Management System</h1>
        <p>This system is designed to help manage the production schedules and worker assignments for ABC Company's workshops.</p>
    </div>

    <div class="footer">
        <h3>Our Products</h3>
        <div class="product-images">
            <img src="view/img/gio2.jpg" alt="Basket" title="Basket">
            <img src="view/img/met2.jpg" alt="Winnowing Tray" title="Winnowing Tray">
            <img src="view/img/thung2.jpg" alt="Flat Tray" title="Flat Tray">
        </div>
    </div>

</body>
</html>
