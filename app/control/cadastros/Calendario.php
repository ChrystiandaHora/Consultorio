<?php
/**
 * FullCalendarDatabaseView
 *
 * @version    1.0
 * @package    sample
 * @subpackage tutor
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class Calendario extends TPage
{
    private $fc;
    //page constructor
    public function __construct()
    {
        parent::__construct();
        $this->fc = new TFullCalendar(date('Y-m-d'), 'month');
        $this->fc->setReloadAction(new TAction(array($this, 'getEvents')));
        $this->fc->setDayClickAction(new TAction(array('CalendarEventForm', 'onStartEdit')));
        $this->fc->setEventClickAction(new TAction(array('CalendarEventForm', 'onEdit')));
        $this->fc->setEventUpdateAction(new TAction(array('CalendarEventForm', 'onUpdateEvent')));
        
        $this->fc->setOption('businessHours', [ [ 'dow' => [ 1, 2, 3, 4, 5 ], 'start' => '08:00', 'end' => '18:00' ]]);
        $this->fc->setOption('slotDuration', '00:20');
        $this->fc->setOption('slotLabelInterval', '00:20');
        $this->fc->setTimeRange('08:00', '18:00');
        // $this->fc->disableDragging();
        // $this->fc->disableResizing();
        parent::add( $this->fc );
    }
    
    public static function getEvents($param=NULL)
    {
        $return = array();
        try
        {
            TTransaction::open('sample');
            
            $events = Vw_calendario::where('dtinicio', '<=', $param['end'])
                                   ->where('dtfim',   '>=', $param['start'])->load();
            
            if ($events)
            {
                foreach ($events as $event)
                {
                    $event_array = $event->toArray();
                    $event_array['start'] = str_replace( ' ', 'T', $event_array['dtinicio']);
                    $event_array['end']   = str_replace( ' ', 'T', $event_array['dtfim']);
                    
                    $popover_content = $event->render("<b>Título</b>: {titulo} <br> <b>Área</b>: {area_do_medico_nome} <br> <b>Medico</b>: {nome_medico} <br> <b>Paciente</b>: {nome_paciente}");
                    $event_array['title'] = TFullCalendar::renderPopover($event_array['titulo'], 'Tipo de Evento', $popover_content);
                    
                    $return[] = $event_array;
                }
            }
            TTransaction::close();
            echo json_encode($return);
        }
        catch (Exception $e)
        {
            new TMessage('error', $e->getMessage());
        }
    }
    
    public function onReload($param = null)
    {
        if (isset($param['view']))
        {
            $this->fc->setCurrentView($param['view']);
        }
        
        if (isset($param['date']))
        {
            $this->fc->setCurrentDate($param['date']);
        }
    }
}
