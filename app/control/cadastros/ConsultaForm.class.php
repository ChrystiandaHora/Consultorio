<?php
/**
 * ConsultaForm
 *
 * @version    1.0
 * @package    control
 * @subpackage admin
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class ConsultaForm extends TStandardForm
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
        $this->setActiveRecord('consulta');     // defines the active record
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_ConsultaForm');
        $this->form->setFormTitle('Consulta');
        
        // create the form fields
        $id = new TEntry('id');
        $area_do_medico_nome = new TDBCombo('area_do_medico_nome','permission','medico','id','area_do_medico');
        
        $action = new TAction([$this, 'mudaSelecao']);
        $area_do_medico_nome->setChangeAction($action);
        
        $paciente_id = new TDBCombo('paciente_id','permission','paciente','id','nome');
        $titulo = new TCombo('titulo');
        $titulo -> addItems(['Consulta - Primeira Vez'=>'Consulta - Primeira Vez com o Médico(a)','Consulta - Retorno'=>'Consulta - Retorno', 'Exame'=>'Realização de Exame']);        
        $medico_id = new TDBCombo('medico_id','permission','medico','id','nome');
        $dtinicio = new  TDateTime ('dtinicio');
        $dtfim = new  TDateTime ('dtfim');

        $dtinicio->setMask('dd/mm/yyyy hh:ii');
        $dtinicio->setDatabaseMask('yyyy-mm-dd hh:ii');

        $dtfim->setMask('dd/mm/yyyy hh:ii');
        $dtfim->setDatabaseMask('yyyy-mm-dd hh:ii');
        
        // add the fields
        $this->form->addFields( [new TLabel('ID')], [$id]);
        $this->form->addFields( [new TLabel('Título')], [$titulo] ,[new TLabel('Paciente')], [$paciente_id]);
        $this->form->addFields( [new TLabel('Médico')], [$medico_id], [new TLabel('Área da Consulta')], [$area_do_medico_nome]);
        $this->form->addFields([new TLabel('Data Início da Consulta')], [$dtinicio] , [new TLabel('Data Fim da Consulta')],[$dtfim]);
        
        $id->setEditable(FALSE);
        $id->setSize('30%');
        
        $area_do_medico_nome->setSize('80%');
        $area_do_medico_nome->addValidation(('Área da Consulta'), new TRequiredValidator );
        
        $paciente_id->setSize('80%');
        $paciente_id->addValidation(('Paciente'), new TRequiredValidator );

        $titulo->setSize('80%');
        $titulo->addValidation(('Médico'), new TRequiredValidator );
        
        $medico_id->setSize('80%');
        $medico_id->addValidation(('Médico'), new TRequiredValidator );
        
        $dtinicio->setSize('80%');
        $dtinicio->addValidation(('Data Inicio'), new TRequiredValidator );

        $dtfim->setSize('80%');
        $dtfim->addValidation(('Data Fim'), new TRequiredValidator );
        
        // create the form actions
        $btn = $this->form->addAction(_t('Save'), new TAction(array($this, 'onSave')), 'far:save');
        $btn->class = 'btn btn-sm btn-primary';
        $this->form->addActionLink(_t('Clear'),  new TAction(array($this, 'onEdit')), 'fa:eraser red');
        $this->form->addActionLink(_t('Back'),new TAction(array('ConsultaList','onReload')),'far:arrow-alt-circle-left blue');
        
        // vertical box container
        $container = new TVBox;
        $container->style = 'width: 100%';
        $container->add(new TXMLBreadCrumb('menu.xml', 'ConsultaList'));
        $container->add($this->form);
        
        parent::add($container);
    }
    static function mudaSelecao($param)
    {
        TTransaction::open('sample');
        $conn = TTransaction::get();
        //pegando o nome do medico baseado no seu id
        $stmt = $conn->query('SELECT nome FROM medico WHERE id ='.$param["area_do_medico_nome"]);
        $data = $stmt->fetchAll();
        if($data)
        {
        foreach ($data as $row) {
            $nome_medico_area =[$param["area_do_medico_nome"] => $row["nome"]];
            }
        }
        TCombo::reload('form_ConsultaForm', 'medico_id', $nome_medico_area);
        TTransaction::close();
    }
}
