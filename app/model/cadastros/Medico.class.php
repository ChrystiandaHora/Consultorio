<?php
/**
 * Medico
 *
 * @version    1.0
 * @package    model
 * @subpackage admin
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class Medico extends TRecord
{
    const TABLENAME = 'medico';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('nome');
        parent::addAttribute('sexo');
        parent::addAttribute('idade');
        parent::addAttribute('cpf');
        parent::addAttribute('area_do_medico');
        parent::addAttribute('telefone');
        parent::addAttribute('email');
    }
}
