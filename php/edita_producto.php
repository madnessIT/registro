<?php
include('conexion.php');

$id = $_POST['id'];

//OBTENEMOS LOS VALORES DEL PRODUCTO

$valores = mysql_query("SELECT * FROM habitacion WHERE id = '$id'");
$valores2 = mysql_fetch_array($valores);

$datos = array(
				0 => $valores2['id'], 
                1 => $valores2['codigo'], 
				2 => $valores2['tipo'], 
				3 => $valores2['tipo_banio'], 
                4 => $valores2['frigobar'],
                5 => $valores2['sofa_cama'],
                6 => $valores2['cama_Extra'],
				7 => $valores2['nr_simples'],
                8 => $valores2['nro_matrimniales'],
                9 => $valores2['tipo_habitacion'],
                10 => $valores2['tarifa'],
				);
echo json_encode($datos);
?>