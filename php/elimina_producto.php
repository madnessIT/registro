<?php
include('conexion.php');

$id = $_POST['id'];



//ELIMINAMOS EL PRODUCTO

mysql_query("DELETE FROM habitacion WHERE codigo = '$id'");

//ACTUALIZAMOS LOS REGISTROS Y LOS OBTENEMOS

$registro = mysql_query("SELECT * FROM habitacion ORDER BY codigo ASC");

//CREAMOS NUESTRA VISTA Y LA DEVOLVEMOS AL AJAX

echo '<table class="table table-striped table-condensed table-hover">
        	<tr>
            	<th width="200">ID</th>
            	<th width="200">Numero</th>
                <th width="200">Tipo</th>
                <th width="100">Tipo Baño</th>
                <th width="100">Frigobar</th>
                <th width="100">Sofa Cama</th>
                <th width="100">Cama Extra</th>
                <th width="100">Numero Simples</th>
                <th width="100">Numero Matrimoniales</th>
                <th width="100">Tipo Habitacion</th>
                <th width="100">Tarifa</th>
            </tr>';
	while($registro2 = mysql_fetch_array($registro)){
		echo '<tr>
				<td>'.$registro2['id'].'</td>
				<td>'.$registro2['codigo'].'</td>
				<td>'.$registro2['tipo'].'</td>
				<td>'.$registro2['tipo_banio'].'</td>
                <td>'.$registro2['frigobar'].'</td>
                <td>'.$registro2['sofa_cama'].'</td>
                <td>'.$registro2['cama_Extra'].'</td>
                <td>'.$registro2['nr_simples'].'</td>
                <td>'.$registro2['nro_matrimniales'].'</td>
                <td>'.$registro2['tipo_habitacion'].'</td>
                <td>Bs.'.$registro2['tarifa'].'</td>
				<td><a href="javascript:editarProducto('.$registro2['codigo'].');" class="glyphicon glyphicon-edit"></a> <a href="javascript:eliminarProducto('.$registro2['codigo'].');" class="glyphicon glyphicon-remove-circle"></a></td>
				</tr>';
	}
echo '</table>';

?>