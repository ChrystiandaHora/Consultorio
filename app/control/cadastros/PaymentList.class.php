<?php
/**
 * PaymentList
 *
 * @version    1.0
 * @package    control
 * @subpackage admin
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class PaymentList extends TStandardList
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
        parent::setActiveRecord('nota_fiscal');   // defines the active record
        parent::addFilterField('id_paciente', '=', 'id_paciente'); // filterField, operator, formField
        parent::addFilterField('id_area_do_medico', '=', 'id_area_do_medico'); // filterField, operator, formField
        parent::addFilterField('payment', 'like', 'payment');
        parent::addFilterField('status', '=', 'status');
        parent::addFilterField('dtinicio', '>=', 'dtinicio');
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_search_Pagamento');
        $this->form->setFormTitle('Nota Fiscal');
        
        // create the form fields
        $paciente = new TDBCombo('id_paciente','sample','nota_fiscal','id_paciente','nome_paciente');
        $radio = new TRadioGroup('status');
        
        $action = new TAction([$this, 'mudaSelecao']);
        $paciente->setChangeAction($action);
        
        $area_do_medico = new TDBCombo('id_area_do_medico','sample','nota_fiscal','id_area_do_medico','area_nome');
        $payment = new TEntry('payment');
        $dtinicio = new  TDateTime ('dtinicio');
        
        $payment->setMask('999,99');
        $radio->setLayout('horizontal');
        $radio->setUseButton();
        $items = ['Aguardando Pagamento'=>'Aguardando Pagamento', 'Pago'=>'Pago','Próximo do vencimento'=>'Próximo do vencimento','Atrasado'=>'Atrasado'];      
        $radio->addItems($items);
        $radio->setValue('');
       
        // add the fields
        $this->form->addFields( [new TLabel('Paciente')], [$paciente] );
        $this->form->addFields( [new TLabel('Status')], [$radio] );
        $this->form->addFields( [new TLabel('Área da Consulta')], [$area_do_medico] );
        $this->form->addFields( [new TLabel('Pagamento')], [$payment] );
        $this->form->addFields( [new TLabel('Data Inicio')], [$dtinicio] );

        $paciente->setSize('50%');
        $area_do_medico->setSize('50%');
        $payment->setSize('50%');
        $dtinicio->setSize('50%');
        $radio->setSize('50%');

        // keep the form filled during navigation with session data
        $this->form->setData( TSession::getValue('Payment_filter_data') );
        
        // add the search form actions
        $btn = $this->form->addAction(_t('Find'), new TAction(array($this, 'onSearch')), 'fa:search');
        $btn->class = 'btn btn-sm btn-primary';
        $btn = $this->form->addAction(_t('Clear'),  new TAction(array($this, 'onClear')), 'fa:eraser red');  
        $this->form->addAction(_t('New'),  new TAction(array('PaymentForm', 'onEdit')), 'fa:plus green');
        
        //----------------------------------------------------------------------------------------------------------------

        // creates a DataGrid
        $this->datagrid = new BootstrapDatagridWrapper(new TDataGrid);
        $this->datagrid->datatable = 'true';
        $this->datagrid->style = 'width: 100%';
        $this->datagrid->setHeight(320);
        
        // creates the datagrid columns
        $column_paciente = new TDataGridColumn('nome_paciente', ('Paciente'), 'left');
        $column_area_do_medico = new TDataGridColumn('area_nome', ('Área da Consulta'), 'left');
        $column_payment = new TDataGridColumn('payment', ('Pagamento'), 'center');
        $column_status = new TDataGridColumn('status', ('Status'), 'center');
        $column_dtinicio = new TDataGridColumn('dtinicio', ('Data da Consulta'), 'center');

        // add the columns to the DataGrid
        $this->datagrid->addColumn($column_paciente);
        $this->datagrid->addColumn($column_area_do_medico);
        $this->datagrid->addColumn($column_payment);
        $this->datagrid->addColumn($column_status);
        $this->datagrid->addColumn($column_dtinicio);

        // creates the datagrid column actions
        $order_paciente = new TAction(array($this, 'onReload'));
        $order_paciente->setParameter('order', 'id_paciente');
        $column_paciente->setAction($order_paciente);

        $order_area_do_medico = new TAction(array($this, 'onReload'));
        $order_area_do_medico->setParameter('order', 'id_area_do_medico');
        $column_area_do_medico->setAction($order_area_do_medico);

        $order_payment = new TAction(array($this, 'onReload'));
        $order_payment->setParameter('order', 'payment');
        $column_payment->setAction($order_payment);

        $order_status = new TAction(array($this, 'onReload'));
        $order_status->setParameter('order', 'status');
        $column_status->setAction($order_status);

        $column_status->setTransformer(function($value, $object, $row) {
            switch($value){
                case 'Aguardando Pagamento':
                    $class = 'info';
                   $label = 'Aguardando Pagamento';
                break;
                case 'Pago':
                    $class = 'success';
                    $label = 'Pago';
                break;
                case 'Próximo do vencimento':
                    $class = 'warning';
                    $label = 'Próximo do vencimento';
                    break;
                case 'Atrasado':
                    $class = 'danger';
                    $label = 'Atrasado';
                break;
            }
            $div = new TElement('span');
            $div->class ="label label-{$class}";
            $div->style="text-shadow:nome; font-size:12px; font-weight:lighter";
            $div->add($label);
            return $div;
        });

        $order_dia_da_consulta = new TAction(array($this, 'onReload'));
        $order_dia_da_consulta->setParameter('order', 'dtinicio');
        $column_dtinicio->setAction($order_dia_da_consulta);

        // create EDIT action
        $action_edit = new TDataGridAction(array('PaymentForm', 'onEdit'));
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
        $conn = TTransaction::get();
        //pegando o id do paciente através do param
        $stmt = $conn->query('SELECT id_area_do_medico FROM nota_fiscal WHERE id_paciente ='.$param["id_paciente"]);
        $data = $stmt->fetchAll();
        if($data)
        {
            foreach ($data as $row) {
                $medico = $row["id_area_do_medico"];
            }
        }
        //pegando a area do medico relacionado ao id do paciente encontrado acima
        $stmt = $conn->query('SELECT area_do_medico FROM medico WHERE id ='.$medico);
        $data2 = $stmt->fetchAll();
        if($data2)
        {
            foreach ($data2 as $row) {
                $area_consulta =[$medico => $row["area_do_medico"]];
            }
        }
        //imprimindo o TCombo
        echo '<pre>';
        var_dump($data,$data2,$area_consulta);
        echo '</pre>';
        TCombo::reload('form_search_Pagamento', 'id_area_do_medico', $area_consulta);
        TTransaction::close();
    }
    public function onClear()
    {
        $this->form->clear( true );
    }
}
