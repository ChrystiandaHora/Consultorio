<?php
/**
 * VW_calendario
 *
 * @version    1.0
 * @package    model
 * @subpackage admin
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class Vw_calendario extends TRecord
{
    const TABLENAME = 'consulta';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}

    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('paciente_id');
        parent::addAttribute('titulo');
        parent::addAttribute('medico_id');
        parent::addAttribute('area_do_medico_nome');
        parent::addAttribute('dtinicio');
        parent::addAttribute('dtfim');
    }

    public function get_nome_medico()
    {
        if (empty($this->medico))
            $this->medico = new Medico($this->medico_id);
        return $this->medico->nome;
    }

    public function get_nome_paciente()
    {
        if (empty($this->paciente))
            $this->paciente = new Paciente($this->paciente_id);
        return $this->paciente->nome;
    }

    public function get_area_do_medico_nome()
    {
        if (empty($this->medico))
            $this->medico = new Medico($this->medico_id);
        return $this->medico->area_do_medico;
    }
}
