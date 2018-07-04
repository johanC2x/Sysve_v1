<?php
require_once ("person_controller.php");
class Employees extends Person_controller
{
	function __construct()
	{
		parent::__construct('employees');
	}
	 
	function index()
	{
		$config['base_url'] = site_url('/employees/index');
		$config['total_rows'] = $this->Employee->count_all();
		$config['per_page'] = '20';
		$config['uri_segment'] = 3;
		$this->pagination->initialize($config);
		
		$data['controller_name']=strtolower(get_class());
		$data['form_width']=$this->get_form_width();
		$data['manage_table']=get_people_manage_table( $this->Employee->get_all( $config['per_page'], $this->uri->segment( $config['uri_segment'] ) ), $this );
		$this->load->view('people/manage',$data);
	}
	
	/*
	Returns employee table data rows. This will be called with AJAX.
	*/
	function search()
	{
		$search=$this->input->post('search');
		$data_rows=get_people_manage_table_data_rows($this->Employee->search($search),$this);
		echo $data_rows;
	}
	
	/*
	Gives search suggestions based on what is being searched for
	*/
	function suggest()
	{
		$suggestions = $this->Employee->get_search_suggestions($this->input->post('q'),$this->input->post('limit'));
		echo implode("\n",$suggestions);
	}
	
	/*
	Loads the employee edit form
	*/
	function view($employee_id=-1)
	{
		$data['person_info']=$this->Employee->get_info($employee_id);
		$data['all_modules']=$this->Module->get_all_modules();
		$this->load->view("employees/form",$data);
	}
	
	/*
	Inserts/updates an employee
	*/
	function save($employee_id=-1) {
		if($this->input->post('first_name') != ""
		   and $this->input->post('last_name') != ""
		   and $this->input->post('email') != ""
	       and $this->input->post('phone_number') != "" ){
		$person_data = array(
			'first_name'=>$this->input->post('first_name'),
			'last_name'=>$this->input->post('last_name'),
			'email'=>$this->input->post('email'),
			'phone_number'=>$this->input->post('phone_number'),
			'address_1'=>$this->input->post('address_1'),
			'address_2'=>$this->input->post('address_2'),
			'city'=>$this->input->post('city'),
			'state'=>$this->input->post('state'),
			'zip'=>$this->input->post('zip'),
			'country'=>$this->input->post('country'),
			'comments'=>$this->input->post('comments')
		);
		$permission_data = $this->input->post("permissions")!=false ? $this->input->post("permissions"):array();
		
		if($this->input->post('password')!=''){
			$employee_data=array(
				'username'=>$this->input->post('username'),
				'password'=>md5($this->input->post('password'))
			);
		}else{
			$employee_data=array('username'=>$this->input->post('username'));
		}
		
		if($employee_id === -1){
			$username = $this->input->post('username');
			$objEmployee = $this->Employee->get_info_username($username);
			if(sizeof($objEmployee) > 0){
				echo json_encode(array(
					'success'=>false,
					'message'=> 'El usuario ingresado actualmente existe'
				));
			}else{
				if($this->Employee->save($person_data,$employee_data,$permission_data,$employee_id)){
					if($employee_id==-1){
						echo json_encode(array('success'=>true,'message'=>$this->lang->line('employees_successful_adding').' '.
						$person_data['first_name'].' '.$person_data['last_name'],'person_id'=>$employee_data['person_id']));
					}else{
						echo json_encode(array('success'=>true,'message'=>$this->lang->line('employees_successful_updating').' '.
						$person_data['first_name'].' '.$person_data['last_name'],'person_id'=>$employee_id));
					}
				}else{	
					echo json_encode(array('success'=>false,'message'=>$this->lang->line('employees_error_adding_updating').' '.
					$person_data['first_name'].' '.$person_data['last_name'],'person_id'=>-1));
				}
			}
		}else{
			if($this->Employee->save($person_data,$employee_data,$permission_data,$employee_id)){
				if($employee_id==-1){
					echo json_encode(array('success'=>true,'message'=>$this->lang->line('employees_successful_adding').' '.
					$person_data['first_name'].' '.$person_data['last_name'],'person_id'=>$employee_data['person_id']));
				}else{
					echo json_encode(array('success'=>true,'message'=>$this->lang->line('employees_successful_updating').' '.
					$person_data['first_name'].' '.$person_data['last_name'],'person_id'=>$employee_id));
				}
			}else{	
				echo json_encode(array('success'=>false,'message'=>$this->lang->line('employees_error_adding_updating').' '.
				$person_data['first_name'].' '.$person_data['last_name'],'person_id'=>-1));
			}
		}
	}else{
		echo json_encode(array('success'=>false,'message'=>$this->lang->line('No se deben ingresar campos vacios Email / Nombre / Apellidos / Numero de Telefono')));
	}
	//redirect('/employees/index','index'); 
}
	
	/*
	This deletes employees from the employees table
	*/
	function delete()
	{
		$employees_to_delete=$this->input->post('ids');
		
		if($this->Employee->delete_list($employees_to_delete))
		{
			echo json_encode(array('success'=>true,'message'=>$this->lang->line('employees_successful_deleted').' '.
			count($employees_to_delete).' '.$this->lang->line('employees_one_or_multiple')));
		}
		else
		{
			echo json_encode(array('success'=>false,'message'=>$this->lang->line('employees_cannot_be_deleted')));
		}
	}
	/*
	get the width for the add/edit form
	*/
	function get_form_width()
	{
		return 650;
	}
}
?>