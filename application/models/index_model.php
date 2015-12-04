<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Index_model extends CI_Model {

	function __construct()
	{
		parent::__construct();

	}
	

	function verTodo()
	{
		$query = $this->db->get('aspirante');
		if ($query -> num_rows() > 0)
		{
			return $query;
		} else
		{
			return FALSE;
		}
	}

	
	
	function logueo($query)
	{
		$this->db->like('folioUV', $query);
		$query=$this->db->get('aspirante');
		if ($query->num_rows() > 0)
		{
			return $query;
		}
		else
		{
			return FALSE;
		}
	}
	
	function crear($data)
	{
		$this->db->insert('examen', $data);
			
	}

}