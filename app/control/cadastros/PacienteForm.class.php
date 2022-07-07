<?php
/**
 * PacienteForm
 *
 * @version    1.0
 * @package    control
 * @subpackage admin
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class PacienteForm extends TStandardForm
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
        $this->setActiveRecord('paciente');     // defines the active record
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_PacienteForm');
        $this->form->setFormTitle('Paciente');
        
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
        $endereco = new TEntry('endereco');
        $cidade = new TEntry('cidade');
        $numero = new TEntry('numero');
        $bairro = new TEntry('bairro');
        $uf = new TCombo('uf');
        $uf -> setValue('');
        $uf-> addItems(['AC'=>'Acre','AL'=>'Alagoas','AP'=>'Amapá','AM'=>'Amazonas','BA'=>'Bahia','CE'=>'Ceará','DF'=>'Distrito Federal','ES'=>'Espírito Santo','GO'=>'Goiás','MA'=>'Maranhão','MT'=>'Mato Grosso','MS'=>'Mato Grosso do Sul','MG'=>'Minas Gerais','PA'=>'Pará','PB'=>'Paraíba','PR'=>'Paraná','PE'=>'Pernambuco','PI'=>'Piauí','RJ'=>'Rio de Janeiro','RN'=>'Rio Grande do Norte','RS'=>'Rio Grande do Sul','RO'=>'Rondônia','RR'=>'Roraima','SC'=>'Santa Catarina','SP'=>'São Paulo','SE'=>'Sergipe','TO'=>'Tocantins',]); 
        $complemento = new TEntry('complemento');
        $telefone = new TEntry('telefone');
        $telefone -> setMask('(99) 99999-9999');
        $email = new TEntry('email');
        $email->addValidation('email',new TEmailValidator);

        // add the fields
        $this->form->addFields( [new TLabel('ID')],[$id] );
        $this->form->addFields( [new TLabel('Nome <font color="red">*</font>')], [$nome], [new TLabel('Sexo <font color="red">*</font>')], [$sexo] );
        $this->form->addFields( [new TLabel('Idade <font color="red">*</font>')], [$idade], [new TLabel('Telefone <font color="red">*</font>')], [$telefone] );
        $this->form->addFields( [new TLabel('CPF <font color="red">*</font>')], [$cpf], [new TLabel('Cidade <font color="red">*</font>')], [$cidade] );
        $this->form->addFields( [new TLabel('Endereço <font color="red">*</font>')], [$endereco],[new TLabel('Número <font color="red">*</font>')], [$numero] );
        $this->form->addFields( [new TLabel('Bairro <font color="red">*</font>')], [$bairro],[new TLabel('Complemento')], [$complemento] );
        $this->form->addFields( [new TLabel('UF <font color="red">*</font>')], [$uf], [new TLabel('E-Mail <font color="red">*</font>')], [$email] );
        
        $id->setEditable(FALSE);
        $id->setSize('400');

        $nome->setSize('400');
        $nome->addValidation(('Nome'), new TRequiredValidator );

        $sexo->setSize('400');
        $sexo->addValidation(('Sexo'), new TRequiredValidator );

        $idade->setSize('400');
        $idade->addValidation(('Idade'), new TRequiredValidator );

        $cpf->setSize('400');
        $cpf->addValidation(('CPF'), new TRequiredValidator );

        $endereco->setSize('400');
        $endereco->addValidation(('Endereço'), new TRequiredValidator );

        $cidade->setSize('400');
        $cidade->addValidation(('Cidade'), new TRequiredValidator );

        $numero->setSize('400');
        $numero->addValidation(('Número'), new TRequiredValidator );

        $bairro->setSize('400');
        $bairro->addValidation(('Bairro'), new TRequiredValidator );

        $uf->setSize('400');
        $uf->addValidation(('UF'), new TRequiredValidator );

        $complemento->setSize('400');

        $telefone->setSize('400');
        $telefone->addValidation(('Telefone'), new TRequiredValidator );

        $email->setSize('400');
        $email->addValidation(('E-mail'), new TRequiredValidator );
        
        // create the form actions
        $btn = $this->form->addAction(_t('Save'), new TAction(array($this, 'onSave')), 'far:save');
        $btn->class = 'btn btn-sm btn-primary';
        $this->form->addActionLink(_t('Clear'),  new TAction(array($this, 'onEdit')), 'fa:eraser red');
        $this->form->addActionLink(_t('Back'),new TAction(array('PacienteList','onReload')),'far:arrow-alt-circle-left blue');
        
        // vertical box container
        $container = new TVBox;
        $container->style = 'width: 100%';
        $container->add(new TXMLBreadCrumb('menu.xml', 'PacienteList'));
        $container->add($this->form);
        
        parent::add($container);
    }
}
