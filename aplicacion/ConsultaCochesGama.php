<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="./app.css" >
        <title>Lista de Vehiculos</title>
    </head>
    <body>
        <?php
        // Mostrar todos los errores (útil para debugging)
        ini_set('display_errors', 1);
        error_reporting(E_ALL);
        // Conectar a la base de datos
        // Cambiar el servername por el que proceda: localhost, IP, url, …
        $servername = "127.0.0.1";
        $username = "ubuntu";
        $password = "password";
        $dbname = "autocamp";
        $conn = new mysqli($servername, $username, $password, $dbname);
        // Verificar la conexión
        if ($conn->connect_error) {
        die("Conexión fallida: " . $conn->connect_error);
        }
        ?>
        <header>
            <div class="cabecera">
                <div class="titulo">
                    <p class="roboto-black">AutoCamp</p>
                </div>
                <div class="enlaces roboto-regular">
                    <ul>
                        <li>
                            <a href="../index.html">Inicio</a>
                        </li>
                        <li>
                            <a href="../index.html#quienes-somos">Quienes somos</a>
                        </li>
                        <li>
                            <a href="./MenuConsultas.html">Portal</a>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
        <main>
            <div class="tablaDiv">
                <?php
                            // Consultar los datos
                            $sql = "SELECT * FROM coche inner join gama on coche.codgama = gama.codgama  where coche.codgama = 'F1'";
                            $result = $conn->query($sql);
                            if ($result === false) {
                            die("Error en la consulta: " . $conn->error);
                            }
                            if ($result->num_rows > 0) {
                            while($row = $result->fetch_assoc()) {
                            echo "
                            <h1>Gama {$row['nomgama']}</h1>
                            <table class="center tabla">
                            <thead>
                                <tr>
                                    <th>Matricula</th>
                                    <th>Modelo</th>
                                    <th>Consulta del coche</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>{$row['matricula']}</td>
                                    <td>{$row['modelo']}</td>
                                    <td><a href='consulta_coche.php?matricula={$row['matricula']}'>Ver más</a></td>
                                </tr>
                            </tbody>
                            </table>";
                            }
                            }
                ?>    
                <?php
                            // Consultar los datos
                            $sql = "SELECT * FROM coche inner join gama on coche.codgama = gama.codgama  where coche.codgama = 'F2'";
                            $result = $conn->query($sql);
                            if ($result === false) {
                            die("Error en la consulta: " . $conn->error);
                            }
                            if ($result->num_rows > 0) {
                            while($row = $result->fetch_assoc()) {
                            echo "
                            <h1>Gama {$row['nomgama']}</h1>
                            <table class="center tabla">
                            <thead>
                                <tr>
                                    <th>Matricula</th>
                                    <th>Modelo</th>
                                    <th>Consulta del coche</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>{$row['matricula']}</td>
                                    <td>{$row['modelo']}</td>
                                    <td><a href='consulta_coche.php?matricula={$row['matricula']}'>Ver más</a></td>
                                </tr>
                            </tbody>
                            </table>";
                            }
                            }
                ?>    
                <?php
                            // Consultar los datos
                            $sql = "SELECT * FROM coche inner join gama on coche.codgama = gama.codgama  where coche.codgama = 'L1'";
                            $result = $conn->query($sql);
                            if ($result === false) {
                            die("Error en la consulta: " . $conn->error);
                            }
                            if ($result->num_rows > 0) {
                            while($row = $result->fetch_assoc()) {
                            echo "
                            <h1>Gama {$row['nomgama']}</h1>
                            <table class="center tabla">
                            <thead>
                                <tr>
                                    <th>Matricula</th>
                                    <th>Modelo</th>
                                    <th>Consulta del coche</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>{$row['matricula']}</td>
                                    <td>{$row['modelo']}</td>
                                    <td><a href='consulta_coche.php?matricula={$row['matricula']}'>Ver más</a></td>
                                </tr>
                            </tbody>
                            </table>";
                            }
                            }
                            ?>                  
                <?php
                            // Consultar los datos
                            $sql = "SELECT * FROM coche inner join gama on coche.codgama = gama.codgama  where coche.codgama = 'T1'";
                            $result = $conn->query($sql);
                            if ($result === false) {
                            die("Error en la consulta: " . $conn->error);
                            }
                            if ($result->num_rows > 0) {
                            while($row = $result->fetch_assoc()) {
                            echo "
                            <h1>Gama {$row['nomgama']}</h1>
                            <table class="center tabla">
                            <thead>
                                <tr>
                                    <th>Matricula</th>
                                    <th>Modelo</th>
                                    <th>Consulta del coche</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>{$row['matricula']}</td>
                                    <td>{$row['modelo']}</td>
                                    <td><a href='consulta_coche.php?matricula={$row['matricula']}'>Ver más</a></td>
                                </tr>
                            </tbody>
                            </table>";
                            }
                            }
                            ?>                                  
            </div>
        </main>
    </body>
</html>