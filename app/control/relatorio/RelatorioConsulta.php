<?php
/**
 * RelatórioConsulta
 *
 * @version    1.0
 * @package    model
 * @subpackage admin
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class RelatorioConsulta extends TPage
{
    private $form;
    
    public function __construct()
    {
      parent::__construct();

      $this->form = new BootstrapFormBuilder('form_ConsultaForm');
      $this->form->setFormTitle('Relatorio das Consultas');
        
      // create the form fields
      $area_do_medico_nome = new TDBCombo('area_do_medico_nome','permission','medico','id','area_do_medico');  
      $paciente_id = new TDBCombo('paciente_id','permission','paciente','id','nome');
      $medico_id = new TDBCombo('medico_id','permission','medico','id','nome');
      $dtinicio = new  TDateTime ('dtinicio');
      $dtinicio->setMask('dd/mm/yyyy hh:ii');
      $dtinicio->setDatabaseMask('yyyy-mm-dd hh:ii');
      $output = new TRadioGroup('output');

      $this->form->addFields( [new TLabel('Paciente')], [$paciente_id] ,[new TLabel('Área da Consulta')], [$area_do_medico_nome] );
      $this->form->addFields( [new TLabel('Médico')], [$medico_id] ,[new TLabel('Data Inicio')], [$dtinicio] );
      $this->form->addFields( [new TLabel('Formato')], [$output] );  
      
      $area_do_medico_nome->setSize('400');
      $paciente_id->setSize('400');
      $medico_id->setSize('400');
      $dtinicio->setSize('400');

      $output-> setUseButton();
      
      $output->addItems(['html'=> 'HTML','pdf'=>'PDF','xls'=>'XLS']);
      $output->setValue('html');
      $output->setLayout('horizontal');

      $this->form->addAction('Gerar', new TAction([$this, 'onGenerate']),'fa:download blue');

      parent::add($this->form);
    }
    public function onGenerate($param)
    {
      try
      {
        TTransaction::open('sample');
        $data = $this -> form-> getData();
        $repository = new TRepository('Consulta');
        $criteria = new TCriteria;

        if($data->area_do_medico_nome)
        {
          $criteria->add(new TFilter('area_do_medico_nome','=',$data->area_do_medico_nome));
        }
        
        if($data->paciente_id)
        {
          $criteria->add(new TFilter('paciente_id','=',$data->paciente_id));
        }

        if($data->medico_id)
        {
          $criteria->add(new TFilter('medico_id','=',$data->medico_id));
        }

        if($data->dtinicio)
        {
          $criteria->add(new TFilter('dtinicio','=',$data->dtinicio));
        }

        $consulta = $repository-> load($criteria);
      
        if($consulta)
        {
          $widths=[220, 220, 150, 220, 0,0,0,0,0,0,0,0,0];
          //paciente_id, medico_id, dtinicio, area_do_medico_nome,ESSE ULTIMO ZERO É DE ALGUMA PARADA PARA NAO QUEBRAR E APARECER ERRO ESTÁ DENTRO DA PADRONIZAÇÃO.
          switch($data->output)
          {
            case 'html':
              $table = new TTableWriterHTML($widths);
              break;
            case 'pdf':
              $table = new TTableWriterPDF($widths);
              break;
            case 'xls':
              $table = new TTableWriterXLS($widths);
              break;
          }
          if(!empty($table))
          {
            $table -> addStyle('header','Helvetica','16','B','#000','#40cfff');
            $table -> addStyle('title','Helvetica','10','B','#000','#ffffff');
            $table -> addStyle('datap','Helvetica','10','','#000','#ffffff','LR');
            $table -> addStyle('datai','Helvetica','10','','#000','#C0C0C0','LR');
            $table -> addStyle('footer','Helvetica','10','','#000','#40cfff');
          }
          $table -> setHeaderCallback(function($table){
            $table -> addRow();
            $table -> addCell('Relatório das Consultas','center','header',5);

            $table -> addRow();
            $table -> addCell('Paciente','center','title');
            $table -> addCell('Medico','center','title');
            $table -> addCell('Data da Consulta','center','title');
            $table -> addCell('Área da Consulta','center','title');
          });

          $table->setFooterCallback(function($table){
            $table -> addRow();
            $table -> addCell(date('Y-m-d H:i:s'),'center','footer',13);

          });


          $colour = false;
          foreach($consulta as $consulta)
          {
            $style = $colour ? 'datap': 'datai';
            $table->addRow();
            $table->addCell($consulta->paciente_id,'center',$style);
            $table->addCell($consulta->medico_id,'center',$style);
            $table->addCell($consulta->dtinicio,'center',$style);
            $table->addCell($consulta->area_do_medico_nome,'center',$style);
            $colour=!$colour;
          }

          $output='app/output/tabular.'.$data->output;
          if(!file_exists($output)OR is_writable($output))
          {
            $table->save($output);
            parent::openFile($output);
            new TMessage('info','Relatório gerado com sucesso!');
          }
          else
          {
            throw new Exception('Permissão Negada: '.$output);
          }
        }
        $this -> form -> setData($data);
        
        TTransaction::close();
    }
    catch(Exception $e)
    {
      new TMessage('error', $e->getMessage());
    }
  }
}