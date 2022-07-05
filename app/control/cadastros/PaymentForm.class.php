<?php
/**
 * PaymentForm
 *
 * @version    1.0
 * @package    control
 * @subpackage admin
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class PaymentForm extends TStandardForm
{
    protected $form; // form
    private $id_medico_area;
    
    /**
     * Class constructor
     * Creates the page and the registration form
     */
    function __construct()
    {
        parent::__construct();
        
        $ini  = AdiantiApplicationConfig::get();
        
        $this->setDatabase('permission');              // defines the database
        $this->setActiveRecord('nota_fiscal');     // defines the active record
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_PaymentForm');
        $this->form->setFormTitle('Nota Fiscal');
        
        // create the form fields
        $id = new TEntry('id');
        $paciente_nome = new TDBCombo('id_paciente','permission','consulta','id','nome_paciente');
        
        $action = new TAction([$this, 'mudaSelecao']);
        $paciente_nome->setChangeAction($action);
        
        $area_do_medico = new TDBCombo('id_area_do_medico','permission','nota_fiscal','id','area_medico');
        $payment = new TEntry('payment');
        $payment->setMask('999,99');

        $dtinicio = new  TDateTime ('dtinicio');
        $dtinicio->setMask('dd/mm/yyyy hh:ii');
        $dtinicio->setDatabaseMask('yyyy-mm-dd hh:ii');

        // add the fields
        $this->form->addFields( [new TLabel('ID')], [$id] );
        $this->form->addFields( [new TLabel('Paciente')], [$paciente_nome] );
        $this->form->addFields( [new TLabel('Área da Consulta')], [$area_do_medico] );
        $this->form->addFields( [new TLabel('Pagamento')], [$payment] );
        $this->form->addFields( [new TLabel('Data Inicio')], [$dtinicio] );

        $id->setEditable(FALSE);
        $id->setSize('30%');

        $paciente_nome->setSize('50%');
        $paciente_nome->addValidation(('Paciente'), new TRequiredValidator );

        $area_do_medico->setSize('50%');
        $area_do_medico->addValidation(('Área da Consulta'), new TRequiredValidator );

        $payment->setSize('50%');
        $payment->addValidation(('Pagamento'), new TRequiredValidator );

        $dtinicio->setSize('50%');
        $dtinicio->addValidation(('Data Inicio'), new TRequiredValidator );
       
        // create the form actions
        $btn = $this->form->addAction(_t('Save'), new TAction(array($this, 'onSave')), 'far:save');
        $btn->class = 'btn btn-sm btn-primary';
        $this->form->addActionLink(_t('Clear'),  new TAction(array($this, 'onEdit')), 'fa:eraser red');
        $this->form->addActionLink(_t('Back'),new TAction(array('PaymentList','onReload')),'far:arrow-alt-circle-left blue');
        
        // vertical box container
        $container = new TVBox;
        $container->style = 'width: 100%';
        $container->add(new TXMLBreadCrumb('menu.xml', 'PaymentList'));
        $container->add($this->form);
        
        parent::add($container);

    }
    static function mudaSelecao($param)
    {
        TTransaction::open('sample');
        $conn = TTransaction::get();
        //pegando o id da area do medico
        $stmt = $conn->query('SELECT area_do_medico_nome FROM consulta WHERE id ='.$param["id_paciente"]);
        $data = $stmt->fetchAll();
        if($data)
        {
        foreach ($data as $row) {
            $id_medico_area = $row["area_do_medico_nome"];
            }
        }
        //pegando o nome do medico baseado na sua id antes pega
        $stmt = $conn->query('SELECT nome FROM medico WHERE id ='.$id_medico_area);
        $data = $stmt->fetchAll();
        if($data)
        {
        foreach ($data as $row) {
            $nome_medico_area =[$id_medico_area => $row["nome"]];
            }
        }
        //imprimindo o TCombo
        TCombo::reload('form_PaymentForm', 'id_area_do_medico', $nome_medico_area);
        TTransaction::close();
    }
}