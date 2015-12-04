<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Preguntas_controller extends CI_Controller {
	function __construct()
	{
		parent::__construct();
		$this->load->model('preguntas_model');
	}

	function index()
	{
		$data = array(
			'pregunta' => $this->preguntas_model->consultaPregunta(),
		);

		$this->load->view('headers/librerias');
		$this->load->view('preguntas', $data);
		$this->load->view('footer');
	}

	public function siguiente()
	{
		/*$data = array(
			'pregunta' => $this->preguntas_model->consultaPregunta(),
		);	

		if ($pregunta != FALSE) {
			 foreach ($pregunta->result() as $row){
			 	$row->numeroPregunta;
			 	$cont = $cont + 1;
			 }
		}*/
		redirect('preguntas_controller/vista');
	}

	public function vista()
	{
		$this->load->view('prueba');
	}

}
