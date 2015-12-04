	<div id="panelinstrucc">
	<p tabindex="0">Instrucciones: Para desplazarse utiliza tecla tabulador. En ésta página se mostrará 
		un caso ejemplo de cómo resolver y desplazarse en el examen.
		Para regresar a la página anterior pulse Alt Shift r.
	</p>
	<p tabindex="0">Para escuchar la pregunta y sus opciones utilice tabulador. Presione la tecla 
		Alt seguido de tecla Shift; y sin dejar de presionar la tecla Alt,
			utilice las teclas numéricas del 1 al 4 según la opción que se elija.</p>
	<div tabindex="0">
		<p>Ejemplo: Si se desea seleccionar el inciso A hay que presionar Alt Shit 1. Para el inciso B
			sería el número 2 y así sucesivamente.</p>
		<p>Si ya ha marcado una de las opciones desplácese con tabulador (évite en lo posible hacer uso de la navegación
			con flecha arriba y abajo una vez que seleccione la respuesta, de lo contrario puede que cambie la opción que eligió			).
		<p>Siempre se puede regresar la navegación para volver a escuchar las opciones con las teclas shift tabulador. </p>
	</div>
	<p tabindex="0">Puedes dejar una pregunta sin responder con tan solo no elegir ninguna opción, eso
		hará que automáticamente una pregunta sea para responder más tarde al finalizar el examen para que la conteste
		tranquilamente después.</p>
	<p tabindex="0"> Cuidado al elegir tu respuesta, una vez que elijas una opción y pases a la siguiente pregunta no podrás
			modificarla.</p>
	</div>
	<br>
	<form>
		
		<label for ="pregunta" tabindex="0">1. ¿Cuánto es 2 más 2?</label>
		<br>
		<input id="botonA" accesskey="1" type="radio" name="radio"  value="A" aria-describedby="r1"></input>
  		<label for="botonA" tabindex="0">Inciso A)... 2</label>
  		<br>
  		<input id="botonB" accesskey="2" type="radio" name="radio"  value="B" aria-describedby="r2"></input>
  		<label for="botonB" tabindex="0">Inciso B)... 4</label>
  		<br>
  		<input id="botonC" accesskey="3" type="radio" name="radio"  value="C" aria-describedby="r3"></input>
  		<label for="botonC" tabindex="0">Inciso C)... 40</label>
  		<br>
  		<input id="botonD" accesskey="4" type="radio" name="radio" value="D" aria-describedby="r4"></input>
  		<label for="botonD" tabindex="0">Inciso D)... 50</label>
		<br>
	</form> 
<br>
<br>
<br>

	<a href="<?php echo site_url('index_controller/confirma'); ?>">Regresar a la anterior</a>
	<div id="info1" aria-hidden="true" name="Adesc">
		Este enlace te llevará a la página de confirmación para presentar examen.
		Para acceder también puedes ingresar al enlace por medio de Alt Shift r.
	</div>
	<div id="r1" aria-hidden="true" name="Adesc">
		Para elegir éste botón presiona Alt Shift 1.
	</div>
	<div id="r2" aria-hidden="true" name="Adesc">
		Para elegir éste botón presiona Alt Shift 2.
	</div>
	<div id="r3" aria-hidden="true" name="Adesc">
		Para elegir éste botón presiona Alt Shift 3.
	</div>
	<div id="r4" aria-hidden="true" name="Adesc">
		Para elegir éste botón presiona Alt Shift 4.