<?php
/**
 * MedicoList
 *
 * @version    1.0
 * @package    control
 * @subpackage admin
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class MedicoList extends TStandardList
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
        parent::setActiveRecord('medico');   // defines the active record
        parent::setDefaultOrder('id', 'asc');         // defines the default order
        parent::addFilterField('id', '=', 'id'); // filterField, operator, formField
        parent::addFilterField('nome', '=', 'nome'); // filterField, operator, formField
        parent::addFilterField('sexo', '=', 'sexo');
        parent::addFilterField('idade', '=', 'idade');
        parent::addFilterField('cpf', '=', 'cpf');
        parent::addFilterField('area_do_medico', '=', 'area_do_medico');
        parent::addFilterField('telefone', '=', 'telefone');
        parent::addFilterField('email', '=', 'email');
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_search_Medico');
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
        $this->form->addFields( [new TLabel('Id')], [$id],[new TLabel('Nome')], [$nome] );
        $this->form->addFields( [new TLabel('Sexo')], [$sexo],[new TLabel('Idade')], [$idade]);
        $this->form->addFields( [new TLabel('Telefone')], [$telefone],[new TLabel('CPF')], [$cpf]);
        $this->form->addFields( [new TLabel('Area de Atuação')], [$area_do_medico] , [new TLabel('E-Mail')], [$email] );
        
        $id->setSize('30%');
        $nome->setSize('80%');
        $sexo->setSize('80%');
        $idade->setSize('80%');
        $cpf->setSize('80%');
        $area_do_medico->setSize('80%');
        $telefone->setSize('80%');
        $email->setSize('80%');

        // keep the form filled during navigation with session data
        $this->form->setData( TSession::getValue('Medico_filter_data') );
        
        // add the search form actions
        $btn = $this->form->addAction(_t('Find'), new TAction(array($this, 'onSearch')), 'fa:search');
        $btn->class = 'btn btn-sm btn-primary';
        $btn = $this->form->addAction(_t('Clear'),  new TAction(array($this, 'onClear')), 'fa:eraser red');  
        $this->form->addAction(_t('New'),  new TAction(array('MedicoForm', 'onEdit')), 'fa:plus green');
        
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
        $column_area_do_medico = new TDataGridColumn('area_do_medico', ('Área de Atuação'), 'left');
        $column_telefone = new TDataGridColumn('telefone', ('Telefone'), 'left');
        $column_email = new TDataGridColumn('email', ('E-Mail'), 'left');


        // add the columns to the DataGrid
        $this->datagrid->addColumn($column_id);
        $this->datagrid->addColumn($column_nome);
        $this->datagrid->addColumn($column_sexo);
        $this->datagrid->addColumn($column_idade);
        $this->datagrid->addColumn($column_cpf);
        $this->datagrid->addColumn($column_area_do_medico);
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

        $order_area_do_medico = new TAction(array($this, 'onReload'));
        $order_area_do_medico->setParameter('order', 'area_do_medico');
        $column_area_do_medico->setAction($order_area_do_medico);

        $order_telefone = new TAction(array($this, 'onReload'));
        $order_telefone->setParameter('order', 'telefone');
        $column_telefone->setAction($order_telefone);

        $order_email = new TAction(array($this, 'onReload'));
        $order_email->setParameter('order', 'email');
        $column_email->setAction($order_email);

        // create EDIT action
        $action_edit = new TDataGridAction(array('MedicoForm', 'onEdit'));
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
