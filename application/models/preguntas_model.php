<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Preguntas_model extends CI_Model {

	function __construct()
	{
		parent::__construct();

	}

	function consultaPregunta()
	{
		$query = $this->db->get('preguntas');
		if ($query -> num_rows() > 0)
		{
			return $query;
		} else
		{
			return FALSE;
		}
	}


}
