<?php
/**
 * RelatórioMedico
 *
 * @version    1.0
 * @package    model
 * @subpackage admin
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class RelatorioMedico extends TPage
{
    private $form;
    
    public function __construct()
    {
      parent::__construct();

      $this-> form = new BootstrapFormBuilder();
      $this-> form -> setFormTitle('Relatório de Médico');

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

      $output = new TRadioGroup('output');

      $this->form->addFields( [new TLabel('Nome')], [$nome] );
      $this->form->addFields( [new TLabel('Sexo')], [$sexo],[new TLabel('Idade')], [$idade]);
      $this->form->addFields( [new TLabel('Telefone')], [$telefone],[new TLabel('CPF')], [$cpf]);
      $this->form->addFields( [new TLabel('Area de Atuação')], [$area_do_medico] , [new TLabel('E-Mail')], [$email] );
      $this->form->addFields( [new TLabel('Formato')], [$output] );  
      
      $nome->setSize('30%');
      $sexo->setSize('80%');
      $idade->setSize('80%');
      $cpf->setSize('80%');      
      $area_do_medico->setSize('80%');      
      $telefone->setSize('80%');
      $email->setSize('80%');
            
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
        $repository = new TRepository('Medico');
        $criteria = new TCriteria;

        if($data->nome)
        {
          $criteria->add(new TFilter('Nome','=',$data->nome));
        }
        
        if($data->sexo)
        {
          $criteria->add(new TFilter('Sexo','=',$data->sexo));
        }

        if($data->idade)
        {
          $criteria->add(new TFilter('Idade','=',$data->idade));
        }

        if($data->cpf)
        {
          $criteria->add(new TFilter('CPF','=',$data->cpf));
        }

        if($data->area_do_medico)
        {
          $criteria->add(new TFilter('Área de Atuação','=',$data->area_do_medico));
        }

        if($data->telefone)
        {
          $criteria->add(new TFilter('Telefone','=',$data->telefone));
        }

        if($data->email)
        {
          $criteria->add(new TFilter('E-mail','=',$data->email));
        }

        $medico = $repository-> load($criteria);
      
        if($medico)
        {
          $widths=[310, 60, 75, 150, 150, 140, 350];
          //nome, sexo, idade, cpf, endereco, cidade, numero, bairro, uf, complemento, telefone, email, ESSE ULTIMO ZERO É DE ALGUMA PARADA PARA NAO QUEBRAR E APARECER ERRO ESTÁ DENTRO DA PADRONIZAÇÃO.
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
            $table -> addCell('Medico','center','header',7);

            $table -> addRow();
            $table -> addCell('Nome','center','title');
            $table -> addCell('Sexo','center','title');
            $table -> addCell('Idade','center','title');
            $table -> addCell('CPF','center','title');
            $table -> addCell('Área de Atuação','center','title');
            $table -> addCell('Telefone','center','title');
            $table -> addCell('E-mail','center','title');
          });

          $table->setFooterCallback(function($table){
            $table -> addRow();
            $table -> addCell(date('Y-m-d H:i:s'),'center','footer',7);

          });


          $colour = false;
          foreach($medico as $medico)
          {
            $style = $colour ? 'datap': 'datai';
            $table->addRow();
            $table->addCell($medico->nome,'center',$style);
            $table->addCell($medico->sexo,'center',$style);
            $table->addCell($medico->idade,'center',$style);
            $table->addCell($medico->cpf,'center',$style);
            $table->addCell($medico->area_do_medico,'center',$style);
            $table->addCell($medico->telefone,'center',$style);
            $table->addCell($medico->email,'center',$style);

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