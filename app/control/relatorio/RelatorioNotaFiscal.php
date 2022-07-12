<?php
/**
 * RelatorioNotaFiscal
 *
 * @version    1.0
 * @package    model
 * @subpackage admin
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class RelatorioNotaFiscal extends TPage
{
    private $form;
    
    public function __construct()
    {
      parent::__construct();

      $this->form = new BootstrapFormBuilder();
      $this->form->setFormTitle('Relatório de Notas Fiscais');
        
      // create the form fields
      $paciente_nome = new TDBCombo('id_paciente','permission','nota_fiscal','id_paciente','nome_paciente');
      $id_area_do_medico = new TDBCombo('id_area_do_medico','permission','nota_fiscal','id_area_do_medico','nome_area_medico');
      $payment = new TEntry('payment');
      $dtinicio = new  TDateTime ('dtinicio');
      $dtinicio->setMask('dd/mm/yyyy hh:ii');
      $dtinicio->setDatabaseMask('yyyy-mm-dd hh:ii');
      $radio = new TRadioGroup('status');
      $radio->setLayout('horizontal');
      $radio->setUseButton();
      $items = ['Aguardando Pagamento'=>'Aguardando Pagamento', 'Pago'=>'Pago','Próximo do vencimento'=>'Próximo do vencimento','Atrasado'=>'Atrasado'];      
      $radio->addItems($items);
      $radio->setValue('');
      $output = new TRadioGroup('output');
      
      $this->form->addFields( [new TLabel('Paciente')], [$paciente_nome] );
      $this->form->addFields( [new TLabel('Status')], [$radio] );
      $this->form->addFields( [new TLabel('Área da Consulta')], [$id_area_do_medico] );
      $this->form->addFields( [new TLabel('Valor da Consulta')], [$payment] );
      $this->form->addFields( [new TLabel('Data Inicio')], [$dtinicio] );
      $this->form->addFields( [new TLabel('Formato')], [$output] );  
      
      
      $paciente_nome->setSize('50%');
      $id_area_do_medico->setSize('50%');
      $payment->setSize('50%');
      $dtinicio->setSize('50%');
      $radio->setSize('50%');
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
        $repository = new TRepository('Nota_Fiscal');
        $criteria = new TCriteria;

        if($data->id_paciente)
        {
          $criteria->add(new TFilter('id_paciente','=',$data->id_paciente));
        }
        
        if($data->id_area_do_medico)
        {
          $criteria->add(new TFilter('id_area_do_medico','=',$data->id_area_do_medico));
        }

        if($data->payment)
        {
          $criteria->add(new TFilter('payment','=',$data->payment));
        }
        
        if($data->status)
        {
          $criteria->add(new TFilter('status','=',$data->status));
        }
        
        if($data->dtinicio)
        {
          $criteria->add(new TFilter('dtinicio','=',$data->dtinicio));
        }
        
        $nota_fiscal = $repository-> load($criteria);
        if($nota_fiscal)
        {
          $widths=[310, 220, 150, 220, 220];
          //id_paciente, id_area_do_medico, payment, status,dtinicio,ESSE ULTIMO ZERO É DE ALGUMA PARADA PARA NAO QUEBRAR E APARECER ERRO ESTÁ DENTRO DA PADRONIZAÇÃO.
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
            $table -> addStyle('title','Helvetica','12','B','#000','#ffffff');
            $table -> addStyle('datap','Helvetica','12','','#000','#ffffff','LR');
            $table -> addStyle('datai','Helvetica','12','','#000','#C0C0C0','LR');
            $table -> addStyle('footer','Helvetica','12','','#000','#40cfff');
          }
          $table -> setHeaderCallback(function($table){
            $table -> addRow();
            $table -> addCell('Relatório de Notas Fiscais','center','header',5);

            $table -> addRow();
            $table -> addCell('Paciente','center','title');
            $table -> addCell('Área da Consulta','center','title');
            $table -> addCell('Valor','center','title');
            $table -> addCell('Status','center','title');
            $table -> addCell('Data da Consulta','center','title');
          });

          $table->setFooterCallback(function($table){
            $table -> addRow();
            $table -> addCell(date('d/m/Y H:i:s'),'center','footer',5);

          });


          $colour = false;
          foreach($nota_fiscal as $nota_fiscal)
          {
            $style = $colour ? 'datap': 'datai';
            $table->addRow();
            $table->addCell($nota_fiscal->nome_paciente,'center',$style);
            $table->addCell($nota_fiscal->nome_area_medico,'center',$style);
            $table->addCell($nota_fiscal->payment,'center',$style);
            $table->addCell($nota_fiscal->status,'center',$style);
            $table->addCell($nota_fiscal->dtinicio,'center',$style);
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