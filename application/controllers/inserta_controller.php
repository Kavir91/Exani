<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Inserta_controller extends CI_Controller {
	function __construct()
	{
		parent::__construct();
		$this->load->model('inserta_model');
	}

	
	public function creaExamen()
	{
		//date_default_timezone_set('America/Mexico_City');
		//$fechadeExamen = date('Y-m-d');
		//$horaIncio=date("H:i:s");
		$data = array(
			'idExamen' => $this ->input->post('idExamen', TRUE),
			'fechadeExamen' => date('Y-m-d'),
			'horaIncio' => date('H:i:s'),
			'horaFin' => date('H:i:s'),
			'verExamen' => $this ->input->post('verExamen', TRUE),	
			

		);
		$this->inserta_model->crear($data);	
		redirect('inserta_controller/pregunta');	
		
	}

	public function preguntas()
	{
		$this->load->view('headers/librerias');
		$this->load->view('preguntas');
		$this->load->view('footer');
	}
}

