<?php
/**
 * ConsultaList
 *
 * @version    1.0
 * @package    control
 * @subpackage admin
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class ConsultaList extends TStandardList
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
        parent::setDatabase('sample');            // defines the database
        parent::setActiveRecord('consulta');   // defines the active record
        parent::addFilterField('area_do_medico_nome', '=', 'area_do_medico_nome'); // filterField, operator, formField
        parent::addFilterField('id', '=', 'id');
        parent::addFilterField('paciente_id', '=', 'paciente_id');
        parent::addFilterField('medico_id', '=', 'medico_id');
        parent::addFilterField('telefone', '=', 'telefone');
        parent::addFilterField('dtinicio', '>=', 'dtinicio');
        parent::addFilterField('dtfim', '>=', 'dtfim');

        // creates the form
        $this->form = new BootstrapFormBuilder('form_search_Consulta');
        $this->form->setFormTitle('Consulta');
        
        // create the form fields
        $id = new TEntry('id');

        $paciente_id = new TDBCombo('paciente_id','sample','paciente','id','nome');
        $area_da_consulta = new TDBCombo('area_do_medico_nome','sample','medico','id','area_do_medico');

        $action = new TAction([$this, 'mudaSelecao']);
        $area_da_consulta->setChangeAction($action);

        $medico_id = new TDBCombo('medico_id','sample','medico','id','nome');
        $dtinicio = new  TDateTime ('dtinicio');
        $dtfim = new  TDateTime ('dtfim');

        $dtinicio->setMask('dd/mm/yyyy hh:ii');
        $dtinicio->setDatabaseMask('yyyy-mm-dd hh:ii');

        $dtfim->setMask('dd/mm/yyyy hh:ii');
        $dtfim->setDatabaseMask('yyyy-mm-dd hh:ii');
        
        // add the fields
        $this->form->addFields( [new TLabel('ID')], [$id] ,[new TLabel('Paciente')], [$paciente_id]);
        $this->form->addFields( [new TLabel('Médico')], [$medico_id], [new TLabel('Área da Consulta')], [$area_da_consulta]);
        $this->form->addFields([new TLabel('Data Início da Consulta')], [$dtinicio] , [new TLabel('Data Fim da Consulta')],[$dtfim]);

        $id->setSize('400');
        $area_da_consulta->setSize('400');
        $paciente_id->setSize('400');
        $medico_id->setSize('400');
        $dtinicio->setSize('400');
        $dtfim->setSize('400');

        // keep the form filled during navigation with session data
        $this->form->setData( TSession::getValue('Consulta_filter_data') );
        
        // add the search form actions
        $btn = $this->form->addAction(_t('Find'), new TAction(array($this, 'onSearch')), 'fa:search');
        $btn->class = 'btn btn-sm btn-primary';
        $btn = $this->form->addAction(_t('Clear'),  new TAction(array($this, 'onClear')), 'fa:eraser red');  
        $this->form->addAction(_t('New'),  new TAction(array('ConsultaForm', 'onEdit')), 'fa:plus green');
        
        // creates a DataGrid
        $this->datagrid = new BootstrapDatagridWrapper(new TDataGrid);
        $this->datagrid->datatable = 'true';
        $this->datagrid->style = 'width: 100%';
        $this->datagrid->setHeight(320);
        
        // creates the datagrid columns
        $column_id = new TDataGridColumn('id', 'Id', 'center', 50);
        $column_paciente_id = new TDataGridColumn('nome_paciente', ('Paciente'), 'left');
        $column_area_da_consulta = new TDataGridColumn('area_do_medico_nome', ('Área da Consulta'), 'left');
        $column_medico_id = new TDataGridColumn('nome_medico', ('Médico'), 'left');
        $column_dia_inicio = new TDataGridColumn('dtinicio', ('Data Início da Consulta'), 'left');
        $column_dia_fim = new TDataGridColumn('dtfim', ('Data Fim da Consulta'), 'left');


        // add the columns to the DataGrid
        $this->datagrid->addColumn($column_id);
        $this->datagrid->addColumn($column_paciente_id);
        $this->datagrid->addColumn($column_area_da_consulta);
        $this->datagrid->addColumn($column_medico_id);
        $this->datagrid->addColumn($column_dia_inicio); 
        $this->datagrid->addColumn($column_dia_fim); 

        $order_id = new TAction(array($this, 'onReload'));
        $order_id->setParameter('order', 'id');
        $column_id->setAction($order_id);
        
        $order_paciente_id = new TAction(array($this, 'onReload'));
        $order_paciente_id->setParameter('order', 'paciente_id');
        $column_paciente_id->setAction($order_paciente_id);

        $order_area_da_consulta = new TAction(array($this, 'onReload'));
        $order_area_da_consulta->setParameter('order', 'area_do_medico_nome');
        $column_area_da_consulta->setAction($order_area_da_consulta);

        $order_dia_da_consulta = new TAction(array($this, 'onReload'));
        $order_dia_da_consulta->setParameter('order', 'area_do_medico_nome');
        $column_area_da_consulta->setAction($order_dia_da_consulta);

        $order_medico_id = new TAction(array($this, 'onReload'));
        $order_medico_id->setParameter('order', 'medico_id');
        $column_medico_id->setAction($order_medico_id);
        
        $order_dia_inicio = new TAction(array($this, 'onReload'));
        $order_dia_inicio->setParameter('order', 'dtinicio');
        $column_dia_inicio->setAction($order_dia_inicio);
        
        $order_dia_fim = new TAction(array($this, 'onReload'));
        $order_dia_fim->setParameter('order', 'dtfim');
        $column_dia_fim->setAction($order_dia_fim);

        // create EDIT action
        $action_edit = new TDataGridAction(array('ConsultaForm', 'onEdit'));
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
    static function mudaSelecao($param)
    {
        TTransaction::open('sample');
        $conn = TTransaction::get("id");
        //pegando o nome do medico baseado no seu id
        $stmt = $conn->query('SELECT nome FROM medico WHERE id ='.$param["area_do_medico_nome"]);
        $data = $stmt->fetchAll();
        if($data)
        {
        foreach ($data as $row) {
            $nome_medico_area =[$param["area_do_medico_nome"] => $row["nome"]];
            }
        }
        TCombo::reload('form_search_Consulta', 'medico_id', $nome_medico_area);
        TTransaction::close();
    }
    public function onClear()
    {
        $this->form->clear( true );
    }
}
