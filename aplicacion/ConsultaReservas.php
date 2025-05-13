<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="./consulta.css" >
        <title>Información coche</title>
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
            <div class="inicio">
                <h1>Lista de reservas:</h1>
            </div>
            <div class="tablaDiv">
                <table class="center tabla">
                    <thead>
                        <tr>
                            <th>Codigo de reserva</th>
                            <th>Cliente</th>
                            <th>Gama seleccionada</th>
                            <th>Fecha de reserva</th>
                            <th>Fecha de inicio</th>
                            <th>Fecha de fin</th>
                            <th>Dias de uso</th>
                            <th>Importe</th>
                            <th>Fecha de devolucion</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // Consultar los datos
                        $sql = "SELECT *, concat(cliente.nombre,' ',cliente.apellid) as nombreC FROM reserva inner join cliente on reserva.codcliente = cliente.codcli inner join gama on reserva.gama = gama.codgama;";
                        $result = $conn->query($sql);
                        if ($result === false) {
                        die("Error en la consulta: " . $conn->error);
                        }
                        if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                        echo " <tr>
                        <td>{$row['codreserva']}</td>
                        <td>{$row['nombreC']}</td>
                        <td>{$row['nomgama']}</td>
                        <td>{$row['fecha_res']}</td>
                        <td>{$row['f_inicio']}</td>
                        <td>{$row['f_fin']}</td>
                        <td>{$row['dias']}</td>
                        <td>{$row['importe']}</td>
                        <td>{$row['f_devolucion']}</td>
                        </tr>
                        
                        ";
                        }
                        }
                        ?>
                    </tbody>
                </table>
            </div>
            <h2><a href="./MenuConsultas.html">Volver</h2></a>
        </main>
    </body>
</html>