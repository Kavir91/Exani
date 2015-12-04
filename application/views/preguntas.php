
<p><b>Preguntas</b></p>
<br>
     <?php 
     if ($pregunta != FALSE) 
     { ?>
          <form class="form-horizontal" role="form" id='pregunta_pendiente' method="POST" action="<?php base_url()?>preguntas_controller/siguiente">
          <?php     
               foreach ($pregunta->result() as $row){
                    if ($row->numeroPregunta == 1){
                    ?>
                    <div tabindex="0" id="vistaPendiente">
                         <p class="questions" id="qname>"><?php echo $row->numeroPregunta?>.<?php echo $row->textoPregunta ?></p>
                    </div>
                    <label tabindex="0"><input role="presentation" accesskey="1" name="radio" tabindex="0" type="radio" value="A" id='radio1_<?php echo $row->incisoA;?>'/> 
                    <?php echo "Inciso A...".$row->incisoA;?></label><br>
                    <label tabindex="0"><input role="presentation" accesskey="1" name="radio" tabindex="0" type="radio" value="B" id='radio1_<?php echo $row->incisoB;?>'/> 
                    <?php echo "Inciso B...".$row->incisoB;?></label><br>
                    <label tabindex="0"><input role="presentation" accesskey="1" name="radio" tabindex="0" type="radio" value="C" id='radio1_<?php echo $row->incisoB;?>'/> 
                    <?php echo "Inciso C...".$row->incisoC;?></label><br>
                    <label tabindex="0"><input role="presentation" accesskey="1" name="radio" tabindex="0" type="radio" value="D" id='radio1_<?php echo $row->incisoB;?>'/> 
                    <?php echo "Inciso D...".$row->incisoD;?></label><br>
                    <br>
                    <button  class='return btn btn-success' name="siguiente" id="siguiente" type='submit' tabindex="0">Siguiente</button>

               <?php
                    }

               }?>
          </form>
     <?php }
     else {
          echo "No hay preguntas";
     }
     ?>   
