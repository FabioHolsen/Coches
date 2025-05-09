<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="./consulta.css" >
        <title>información coche</title>
    </head>
    <body>
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
                            <a href="./aplicacion.html">Portal</a>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
        <main>
            <div class="inicio">
                <h1>Información del coche:</h1>
            </div>
            <div class="tablaDiv">
                <table class="center tabla">
                    <thead>
                        <tr>
                            <th>Matricula</th>
                            <th>Modelo</th>
                            <th>Combustible</th>
                            <th>Motor</th>
                            <th>Plazas</th>
                            <th>Maletas</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // Consultar los datos
                        $sql = "SELECT * FROM coche";
                        $result = $conn->query($sql);
                        if ($result === false) {
                        die("Error en la consulta: " . $conn->error);
                        }
                        if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                        echo " <tr>
                        <td>{$row['matricula']}</td>
                        <td>{$row['modelo']}</td>
                        <td>{$row['combustible']}</td>
                        <td>{$row['motor']}</td>
                        <td>{$row['plazas']}</td>
                        <td>{$row['maletas']}</td>
                        </tr>
                        <img src="./media/{$row['foto']}">
                        ";
                        }
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </main>
    </body>
</html>