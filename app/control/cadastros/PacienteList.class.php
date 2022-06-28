<?php
/**
 * PacienteList
 *
 * @version    1.0
 * @package    control
 * @subpackage admin
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class PacienteList extends TStandardList
{
    protected $form;     // registration form
    protected $datagrid; // listing
    protected $pageNavigation;
    protected $formgrid;
    protected $deleteButton;
    protected $transformCallback;
    
    /**
     * Page constructor
     */
    public function __construct()
    {
        parent::__construct();
        parent::setDatabase('permission');            // defines the database
        parent::setActiveRecord('paciente');   // defines the active record
        parent::setDefaultOrder('id', 'asc');         // defines the default order
        parent::addFilterField('id', '=', 'id'); // filterField, operator, formField
        parent::addFilterField('nome', '=', 'nome'); // filterField, operator, formField
        parent::addFilterField('sexo', '=', 'sexo');
        parent::addFilterField('idade', '=', 'idade');
        parent::addFilterField('cpf', '=', 'cpf');
        parent::addFilterField('endereco', '=', 'endereco');
        parent::addFilterField('cidade', '=', 'cidade');
        parent::addFilterField('numero', '=', 'numero');
        parent::addFilterField('bairro', '=', 'bairro');
        parent::addFilterField('uf', '=', 'uf');
        parent::addFilterField('complemento', 'like', 'complemento');
        parent::addFilterField('telefone', '=', 'telefone');
        parent::addFilterField('email', '=', 'email');
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_search_Paciente');
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
        $this->form->addFields([New TLabel('ID')],[$id]);
        $this->form->addFields( [new TLabel('Nome')], [$nome], [new TLabel('Sexo')], [$sexo] );
        $this->form->addFields( [new TLabel('Idade')], [$idade], [new TLabel('Telefone')], [$telefone] );
        $this->form->addFields( [new TLabel('E-Mail')], [$email], [new TLabel('Cidade')], [$cidade] );
        $this->form->addFields( [new TLabel('Endereço')], [$endereco],[new TLabel('Número')], [$numero] );
        $this->form->addFields( [new TLabel('Bairro')], [$bairro],[new TLabel('UF')], [$uf] );
        $this->form->addFields( [new TLabel('Complemento')], [$complemento], [new TLabel('CPF')], [$cpf] );
        
        $id->setSize('400');
        $nome->setSize('400');
        $sexo->setSize('400');
        $idade->setSize('400');
        $cpf->setSize('400');
        $endereco->setSize('400');
        $cidade->setSize('400');
        $numero->setSize('400');
        $bairro->setSize('400');
        $uf->setSize('400');
        $complemento->setSize('400');
        $telefone->setSize('400');
        $email->setSize('400');

        // keep the form filled during navigation with session data
        $this->form->setData( TSession::getValue('Paciente_filter_data') );
        
        // add the search form actions
        $btn = $this->form->addAction(_t('Find'), new TAction(array($this, 'onSearch')), 'fa:search');
        $btn->class = 'btn btn-sm btn-primary';
        $btn = $this->form->addAction(_t('Clear'),  new TAction(array($this, 'onClear')), 'fa:eraser red');
        $this->form->addAction(_t('New'),  new TAction(array('PacienteForm', 'onEdit')), 'fa:plus green');
        
        // creates a DataGrid
        $this->datagrid = new BootstrapDatagridWrapper(new TDataGrid);
        $this->datagrid->datatable = 'true';
        $this->datagrid->style = 'width: 100%';
        $this->datagrid->setHeight(320);
        
        // creates the datagrid columns
        $column_id = new TDataGridColumn('id', 'Id', 'center', 50);
        $column_nome = new TDataGridColumn('nome', ('Nome'), 'left');
        $column_sexo = new TDataGridColumn('sexo', ('Sexo'), 'left');
        $column_idade = new TDataGridColumn('idade', ('Idade'), 'left');
        $column_cpf = new TDataGridColumn('cpf', ('CPF'), 'left');
        $column_endereco = new TDataGridColumn('endereco', ('Endereço'), 'left');
        $column_cidade = new TDataGridColumn('cidade', ('Cidade'), 'left');
        $column_numero = new TDataGridColumn('numero', ('Número'), 'left');
        $column_bairro = new TDataGridColumn('bairro', ('Bairro'), 'left');
        $column_uf = new TDataGridColumn('uf', ('UF'), 'left');
        $column_complemento = new TDataGridColumn('complemento', ('Complemento'), 'left');
        $column_telefone = new TDataGridColumn('telefone', ('Telefone'), 'left');
        $column_email = new TDataGridColumn('email', ('E-Mail'), 'left');


        // add the columns to the DataGrid
        $this->datagrid->addColumn($column_id);
        $this->datagrid->addColumn($column_nome);
        $this->datagrid->addColumn($column_sexo);
        $this->datagrid->addColumn($column_idade);
        $this->datagrid->addColumn($column_cpf);
        $this->datagrid->addColumn($column_endereco);
        $this->datagrid->addColumn($column_cidade);
        $this->datagrid->addColumn($column_numero);
        $this->datagrid->addColumn($column_bairro);
        $this->datagrid->addColumn($column_uf);
        $this->datagrid->addColumn($column_complemento);
        $this->datagrid->addColumn($column_telefone);
        $this->datagrid->addColumn($column_email);


        // creates the datagrid column actions
        $order_id = new TAction(array($this, 'onReload'));
        $order_id->setParameter('order', 'id');
        $column_id->setAction($order_id);
        
        $order_nome = new TAction(array($this, 'onReload'));
        $order_nome->setParameter('order', 'nome');
        $column_nome->setAction($order_nome);
        
        $order_sexo = new TAction(array($this, 'onReload'));
        $order_sexo->setParameter('order', 'sexo');
        $column_sexo->setAction($order_sexo);

        $order_idade = new TAction(array($this, 'onReload'));
        $order_idade->setParameter('order', 'idade');
        $column_idade->setAction($order_idade);

        $order_cpf = new TAction(array($this, 'onReload'));
        $order_cpf->setParameter('order', 'cpf');
        $column_cpf->setAction($order_cpf);

        $order_endereco = new TAction(array($this, 'onReload'));
        $order_endereco->setParameter('order', 'endereco');
        $column_endereco->setAction($order_endereco);

        $order_cidade = new TAction(array($this, 'onReload'));
        $order_cidade->setParameter('order', 'cidade');
        $column_cidade->setAction($order_cidade);

        $order_numero = new TAction(array($this, 'onReload'));
        $order_numero->setParameter('order', 'numero');
        $column_numero->setAction($order_numero);

        $order_bairro = new TAction(array($this, 'onReload'));
        $order_bairro->setParameter('order', 'bairro');
        $column_bairro->setAction($order_bairro);

        $order_uf = new TAction(array($this, 'onReload'));
        $order_uf->setParameter('order', 'uf');
        $column_uf->setAction($order_uf);

        $order_complemento = new TAction(array($this, 'onReload'));
        $order_complemento->setParameter('order', 'complemento');
        $column_complemento->setAction($order_complemento);

        $order_telefone = new TAction(array($this, 'onReload'));
        $order_telefone->setParameter('order', 'telefone');
        $column_telefone->setAction($order_telefone);

        $order_email = new TAction(array($this, 'onReload'));
        $order_email->setParameter('order', 'email');
        $column_email->setAction($order_email);

        // create EDIT action
        $action_edit = new TDataGridAction(array('PacienteForm', 'onEdit'));
        $action_edit->setButtonClass('btn btn-default');
        $action_edit->setLabel(_t('Edit'));
        $action_edit->setImage('far:edit blue');
        $action_edit->setField('id');
        $this->datagrid->addAction($action_edit);
        
        // create DELETE action
        $action_del = new TDataGridAction(array($this, 'onDelete'));
        $action_del->setButtonClass('btn btn-default');
        $action_del->setLabel(_t('Delete'));
        $action_del->setImage('far:trash-alt red');
        $action_del->setField('id');
        $this->datagrid->addAction($action_del);
        
        // create the datagrid model
        $this->datagrid->createModel();
        
        // create the page navigation
        $this->pageNavigation = new TPageNavigation;
        $this->pageNavigation->enableCounters();
        $this->pageNavigation->setAction(new TAction(array($this, 'onReload')));
        $this->pageNavigation->setWidth($this->datagrid->getWidth());

        $panel = new TPanelGroup;
        $panel->add($this->datagrid);
        $panel->addFooter($this->pageNavigation);
        
        // vertical box container
        $container = new TVBox;
        $container->style = 'width: 100%';
        $container->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
        $container->add($this->form);
        $container->add($panel);
        
        parent::add($container);
    }
    public function onClear()
    {
        $this->form->clear( true );
    }
}
