<div id="panelinstrucc">
    <p tabindex="0">Instrucciones: Para desplazarse en la página ocupa la tecla tabulador.
        Para acceder al "Tutorial de Examen", utilice Alt q.		
        Si los datos son correctos, se puede acceder al enlace "Iniciar Examen", utilice Alt w.
    </p>
</div>

<p tabindex="0">Verifica que tus datos son correctos antes de iniciar el examen.</p>
<br>
<?php
if ($result) {
    foreach ($result->result() as $row) {
        echo "<p tabindex='0' role='alert'>Tu nombre es: " . $row->nombre . " " . $row->ap_paterno . " " . $row->ap_materno . "</p>";
    }
}
?>
<br>
<p tabindex="0">Si tienes dudas de cómo resolver tu examen puedes entrar al siguiente enlace:</p>
<a href="<?php echo site_url('link_controller/tuto'); ?>">Tutorial de Examen</a>
<br>
<br>
<p tabindex="0">Si ya te encuentras listo ingresa en:</p>

<a href="<?php echo site_url('index_controller/creaExamen'); ?>">Iniciar Examen</a>
<div id="info1" aria-hidden="true" name="Adesc">
    Este enlace te mandará a la página del tutorial; en ella especifica cómo resolver
    y desplazarse en el examen.
</div>
<div id="info2" aria-hidden="true" name="Adesc">
    Éste enlace lo llevará a iniciar su examen.
</div>  


