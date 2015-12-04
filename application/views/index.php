<div id="panelinstrucc">
	<p tabindex="0">Instrucciones: Para desplazarse en la página ocupa la tecla tabulador. 
		La tecla comodín para modificar parámetros del lector de pantalla está configurada
		con bloqueo de mayúsculas.</p>
	</div>
	<h1 role="presentation" tabindex="0">
                Examen de ingreso a la Universidad Veracruzana para personas con discapacidad visual.
    </h1>

	<p tabindex="0">
			A continuación presentarás el examen de ingreso a la Universidad Veracruzana.
			El examen contiene 112 preguntas divididas en diferentes secciones, como lo
			son pensamiento matemático, pensamiento analítico, estructura de la lengua y 
			comprensión lectora, y dispondrá de 2 horas y media aproximadamente para resolverlo. 
			Si le surgen dudas con respecto al examen puede preguntar a su aplicador.
	</p>
	<div id="body">
		<form id="form" method="GET" action="<?=base_url()?>index.php/index_controller/logueo">
			<br>
			<label for="query" tabindex="0">Ingrese su folio</label>
			<br>
			<input tabindex="0" maxlength="9" type="text" id="query" name="query" required="true" aria-required="true" aria-describedby="info1"/>
			<br>
			<br>
			<input tabindex="0" type="submit" id="logueo" name="logueo" value="Iniciar sesion" aria-describedby="info2"/>
			<br>
		</form>
	
	<br>
	<br>
	<div id="info1" aria-hidden="true" name="Adesc">
		En éste campo debes escribir tú folio uv que consta de 9 dígitos.
	</div>
	<div id="info2" aria-hidden="true" name="Adesc">
		Este botón al iniciar sesión te redireccionará al tutorial de examen; 
		si el inicio de sesión es incorrecto, pedirá que ingrese correctamente 
		su folio uv.	
	</div>


	