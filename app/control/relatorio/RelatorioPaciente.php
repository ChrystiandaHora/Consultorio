<?php
/**
 * Relatório
 *
 * @version    1.0
 * @package    model
 * @subpackage admin
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class RelatorioPaciente extends TPage
{
    private $form;
    
    public function __construct()
    {
      parent::__construct();

      $this-> form = new BootstrapFormBuilder();
      $this-> form -> setFormTitle('Relatório de Pacientes');

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
      $output = new TRadioGroup('output');

      $this->form->addFields( [new TLabel('Nome')], [$nome], [new TLabel('Sexo')], [$sexo] );
      $this->form->addFields( [new TLabel('Idade')], [$idade], [new TLabel('Telefone')], [$telefone] );
      $this->form->addFields( [new TLabel('CPF')], [$cpf], [new TLabel('Cidade')], [$cidade] );
      $this->form->addFields( [new TLabel('Endereço')], [$endereco],[new TLabel('Número')], [$numero] );
      $this->form->addFields( [new TLabel('Bairro')], [$bairro],[new TLabel('Complemento')], [$complemento] );
      $this->form->addFields( [new TLabel('UF')], [$uf], [new TLabel('E-Mail')], [$email] );
      $this->form->addFields( [new TLabel('Formato')], [$output] );  
      
      $nome->setSize('80%');
      $sexo->setSize('80%');
      $idade->setSize('80%');
      $cpf->setSize('80%');
      $endereco->setSize('80%');
      $cidade->setSize('80%');
      $numero->setSize('80%');
      $bairro->setSize('80%');
      $uf->setSize('80%');
      $complemento->setSize('80%');
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
        $repository = new TRepository('Paciente');
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

        if($data->endereco)
        {
          $criteria->add(new TFilter('Endereço','=',$data->endereco));
        }

        if($data->cidade)
        {
          $criteria->add(new TFilter('Cidade','=',$data->cidade));
        }

        if($data->numero)
        {
          $criteria->add(new TFilter('Número','=',$data->numero));
        }

        if($data->bairro)
        {
          $criteria->add(new TFilter('Bairro','=',$data->bairro));
        }

        if($data->uf)
        {
          $criteria->add(new TFilter('UF','=',$data->uf));
        }

        if($data->complemento)
        {
          $criteria->add(new TFilter('Complemento','=',$data->complemento));
        }

        if($data->telefone)
        {
          $criteria->add(new TFilter('Telefone','=',$data->telefone));
        }

        if($data->email)
        {
          $criteria->add(new TFilter('E-Mail','=',$data->email));
        }

        $paciente = $repository-> load($criteria);
      
        if($paciente)
        {
          $widths=[260, 45, 50, 150, 250, 135, 70, 180, 45, 220, 140, 210];
          //nome, sexo, idade, cpf, endereco, cidade, numero, bairro, uf, complemento, telefone, email
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
            $table -> addCell('Pacientes','center','header',12);

            $table -> addRow();
            $table -> addCell('Nome','center','title');
            $table -> addCell('Sexo','center','title');
            $table -> addCell('Idade','center','title');
            $table -> addCell('CPF','center','title');
            $table -> addCell('endereco','center','title');
            $table -> addCell('Cidade','center','title');
            $table -> addCell('Número','center','title');
            $table -> addCell('Bairro','center','title');
            $table -> addCell('UF','center','title');
            $table -> addCell('Complemento','center','title');
            $table -> addCell('Telefone','center','title');
            $table -> addCell('E-Mail','center','title');
          });

          $table->setFooterCallback(function($table){
            $table -> addRow();
            $table -> addCell(date('Y-m-d H:i:s'),'center','footer',12);

          });


          $colour = false;
          foreach($paciente as $paciente)
          {
            $style = $colour ? 'datap': 'datai';
            $table->addRow();
            $table->addCell($paciente->nome,'center',$style);
            $table->addCell($paciente->sexo,'center',$style);
            $table->addCell($paciente->idade,'center',$style);
            $table->addCell($paciente->cpf,'center',$style);
            $table->addCell($paciente->endereco,'center',$style);
            $table->addCell($paciente->cidade,'center',$style);
            $table->addCell($paciente->numero,'center',$style);
            $table->addCell($paciente->bairro,'center',$style);
            $table->addCell($paciente->uf,'center',$style);
            $table->addCell($paciente->complemento,'center',$style);
            $table->addCell($paciente->telefone,'center',$style);
            $table->addCell($paciente->email,'center',$style);

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