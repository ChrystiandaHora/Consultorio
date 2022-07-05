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
        

        $sql1 = "SELECT c.medico_id AS ID_MEDICO, 
                        m.nome AS NOME_MEDICO, 
                        COUNT(*) AS 'Num. de consultas' 
                        FROM consulta c
                        JOIN medico m ON m.id = c.medico_id
                        GROUP BY c.medico_id, m.nome
                        ORDER BY COUNT(*) ASC;";

        $pre = $conn->prepare($sql1); 

        $pre->execute();

        $colunas = $pre->fetchAll();


        $data[] = ['Medico','Consulta'];
  
        foreach($colunas as $coluna)
        {
            $data[] = [$coluna[1],(float)$coluna[2]];
        }
        
        
        TTransaction::close();

        $this->html->enableSection('main',['data'=>json_encode($data),'width'=>'100%','height'=>'800px','title'=>'Gráfico de Consultas','xtitle'=>'Médicos','ytitle'=>'Número de Consultas','uniqid'=>uniqid()]);

        parent::add($this->html);
    }
}