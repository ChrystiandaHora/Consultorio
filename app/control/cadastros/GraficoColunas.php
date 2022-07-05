<?php

class GraficoColunas extends TPage
{
    private $html;

    public function __construct()
    {
        parent::__construct();

        $this->html = new THtmlRenderer('app/resources/google_column_chart.html');

        TTransaction::open('sample');
        $conn = TTransaction::get();

        $sql1 = "SELECT medico_id AS medicos,
                        COUNT(*) AS 'Num. de consultas'
                        FROM consulta
                        GROUP BY medico_id
                        ORDER BY COUNT(*) DESC;";

        $pre = $conn->prepare($sql1); 

        $pre->execute();

        $colunas = $pre->fetchAll();


        $data[] = ['Medico','Consulta'];
  
        foreach($colunas as $coluna)
        {
            $data[] = ['Medico: '.$coluna[0],(float)$coluna[1]];
        }
        
        
        TTransaction::close();

        $this->html->enableSection('main',['data'=>json_encode($data),'width'=>'100%','height'=>'800px','title'=>'Gráfico de Consultas','xtitle'=>'Médicos','ytitle'=>'Número de Consultas','uniqid'=>uniqid()]);

        parent::add($this->html);
    }
}