<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Inserta_model extends CI_Model {

	function __construct()
	{
		parent::__construct();

	}

	function crear($data)
	{
		$this->db->insert('examen', $data);
			
	}
}
