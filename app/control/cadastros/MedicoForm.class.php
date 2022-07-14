<?php
/**
 * MedicoForm
 *
 * @version    1.0
 * @package    control
 * @subpackage admin
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class MedicoForm extends TStandardForm
{
    protected $form; // form
    
    /**
     * Class constructor
     * Creates the page and the registration form
     */
    function __construct()
    {
        parent::__construct();
        
        $ini  = AdiantiApplicationConfig::get();
        
        $this->setDatabase('permission');              // defines the database
        $this->setActiveRecord('medico');     // defines the active record
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_MedicoForm');
        $this->form->setFormTitle('Médico');
        
        // create the form fields
        $id = new TEntry('id');
        $nome = new TEntry('nome');
        $sexo = new TCombo('sexo');
        $sexo -> addItems(['M'=>'Masculino','F'=>'Feminino']);
        $sexo->setValue('');
        $idade = new TEntry('idade');
        $idade -> setMask('999');
        $cpf = new TEntry('cpf');
        $cpf -> setMask('999.999.999-99');
        $area_do_medico = new TEntry('area_do_medico');
        $telefone = new TEntry('telefone');
        $telefone -> setMask('(99) 99999-9999');
        $email = new TEntry('email');
        $email->addValidation('email',new TEmailValidator);

        // add the fields
        $this->form->addFields( [new TLabel('Id')], [$id],[new TLabel('Nome <font color="red">*</font>')], [$nome] );
        $this->form->addFields( [new TLabel('Sexo <font color="red">*</font>')], [$sexo],[new TLabel('Idade <font color="red">*</font>')], [$idade]);
        $this->form->addFields( [new TLabel('Telefone <font color="red">*</font>')], [$telefone],[new TLabel('CPF <font color="red">*</font>')], [$cpf]);
        $this->form->addFields( [new TLabel('Area de Atuação <font color="red">*</font>')], [$area_do_medico] , [new TLabel('E-Mail <font color="red">*</font>')], [$email] );
        
        $id->setEditable(FALSE);
        $id->setSize('30%');

        $nome->setSize('80%');
        $nome->addValidation(('Nome'), new TRequiredValidator );

        $sexo->setSize('80%');
        $sexo->addValidation(('Sexo'), new TRequiredValidator );

        $idade->setSize('80%');
        $idade->addValidation(('Idade'), new TRequiredValidator );

        $cpf->setSize('80%');
        $cpf->addValidation(('CPF'), new TRequiredValidator );
        
        $area_do_medico->setSize('80%');
        $area_do_medico->addValidation(('Area de Atuacao'), new TRequiredValidator );
        
        $telefone->setSize('80%');
        $telefone->addValidation(('Telefone'), new TRequiredValidator );

        $email->setSize('80%');
        $email->addValidation(('E-mail'), new TRequiredValidator );
        
        // create the form actions
        $btn = $this->form->addAction(_t('Save'), new TAction(array($this, 'onSave')), 'far:save');
        $btn->class = 'btn btn-sm btn-primary';
        $this->form->addActionLink(_t('Clear'),  new TAction(array($this, 'onEdit')), 'fa:eraser red');
        $this->form->addActionLink(_t('Back'),new TAction(array('MedicoList','onReload')),'far:arrow-alt-circle-left blue');
        
        // vertical box container
        $container = new TVBox;
        $container->style = 'width: 100%';
        $container->add(new TXMLBreadCrumb('menu.xml', 'MedicoList'));
        $container->add($this->form);
        
        parent::add($container);
    }
}
