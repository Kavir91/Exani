<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Link_controller extends CI_Controller {
	function __construct()
	{
		parent::__construct();
	}

	public function tuto()
	{
		$this->load->view('headers/librerias');
		$this->load->view('tutorial');
		$this->load->view('footer');
	}
}