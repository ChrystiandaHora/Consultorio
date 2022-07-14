<?php
/**
 * nota_fiscal
 *
 * @version    1.0
 * @package    model
 * @subpackage admin
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class nota_fiscal extends TRecord
{
    private $paciente;
    private $medico;


    const TABLENAME = 'nota_fiscal';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('id_paciente');
        parent::addAttribute('id_area_do_medico');
        parent::addAttribute('payment');
        parent::addAttribute('status');
        parent::addAttribute('dtinicio');
    }

    public function get_nome_paciente()
    {
        if (empty($this->paciente))
            $this->paciente = new Paciente($this->id_paciente);
        return $this->paciente->nome;
    }
    
    public function get_area_nome()
    {
        if (empty($this->medico))
            $this->medico = new Medico($this->id_area_do_medico);
        return $this->medico->area_do_medico;
    }
    
}
