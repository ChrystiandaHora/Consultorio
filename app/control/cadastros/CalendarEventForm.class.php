<?php
/**
 * CalendarEventForm
 *
 * @version    1.0
 * @package    sample
 * @subpackage tutor
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */


class CalendarEventForm extends TWindow
{
    protected $form; // form
    
    public function __construct()
    {
        parent::__construct();
        parent::setSize(700, null);
        parent::setTitle('Evento do Calendario');
        parent::removePadding();
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_event');
        $this->form->setProperty('style', 'margin-bottom:0');
        
        $hours = array();
        $minutes = array();
        for ($n = 8; $n <= 18; $n++)
        {
            $hours[$n] = str_pad($n, 2, '0', STR_PAD_LEFT);
        }
        
        for ($n=0; $n<=55; $n+=5)
        {
            $minutes[$n] = str_pad($n, 2, '0', STR_PAD_LEFT);
        }
        
        // create the form fields
        $view           = new THidden('view');
        $id             = new TEntry('id');
        $start_date     = new TDate('start_date');
        $start_date     ->setMask( "dd/mm/yyyy" );
        $start_date     ->setDatabaseMask("yyyy-mm-dd");        
        $start_hour     = new TCombo('start_hour');
        $start_minute   = new TCombo('start_minute');
        $end_date       = new TDate('end_date');
        $end_date       ->setMask( "dd/mm/yyyy" );
        $end_date       ->setDatabaseMask("yyyy-mm-dd");
        $end_hour       = new TCombo('end_hour');
        $end_minute     = new TCombo('end_minute');
        $titulo         = new TCombo('titulo');
        $titulo -> addItems(['Consulta - Primeira Vez'=>'Consulta - Primeira Vez com o Médico(a)','Consulta - Retorno'=>'Consulta - Retorno', 'Exame'=>'Realização de Exame']); 
        
        $start_hour->addItems($hours);
        $start_minute->addItems($minutes);
        $end_hour->addItems($hours);
        $end_minute->addItems($minutes);
        
        $id->setEditable(FALSE);
        
        // define the sizes
        $id->setSize(40);
        $start_date->setSize(120);
        $end_date->setSize(120);
        $start_hour->setSize(70);
        $end_hour->setSize(70);
        $start_minute->setSize(70);
        $end_minute->setSize(70);
        $titulo->setSize(400);

        
        $start_hour->setChangeAction(new TAction(array($this, 'onChangeStartHour')));
        $end_hour->setChangeAction(new TAction(array($this, 'onChangeEndHour')));
        $start_date->setExitAction(new TAction(array($this, 'onChangeStartDate')));
        $end_date->setExitAction(new TAction(array($this, 'onChangeEndDate')));

        // add one row for each form field
        $this->form->addFields( [$view] );
        $this->form->addFields( [new TLabel('ID:')], [$id] );
        $this->form->addFields( [new TLabel('Hora de Início:')], [$start_date, $start_hour, ':', $start_minute] );
        $this->form->addFields( [new TLabel('Hora do Fim:')], [$end_date, $end_hour, ':', $end_minute] );
        $this->form->addFields( [new TLabel('Título:')], [$titulo] );
        
        $this->form->addAction( _t('Save'),   new TAction(array($this, 'onSave')),   'fa:save green');
        $this->form->addAction( _t('Clear'),  new TAction(array($this, 'onEdit')),   'fa:eraser orange');
        $this->form->addAction( _t('Delete'), new TAction(array($this, 'onDelete')), 'far:trash-alt red');
        
        parent::add($this->form);
    }

    public static function onChangeStartHour($param=NULL)
    {
        $obj = new stdClass;
        if (empty($param['start_minute']))
        {
            $obj->start_minute = '0';
            TForm::sendData('form_event', $obj);
        }
        
        if (empty($param['end_hour']) AND empty($param['end_minute']))
        {
            $obj->end_hour = $param['start_hour'] +1;
            $obj->end_minute = '0';
            TForm::sendData('form_event', $obj);
        }
    }

    public static function onChangeEndHour($param=NULL)
    {
        if (empty($param['end_minute']))
        {
            $obj = new stdClass;
            $obj->end_minute = '0';
            TForm::sendData('form_event', $obj);
        }
    }

    public static function onChangeStartDate($param=NULL)
    {
        if (empty($param['end_date']) AND !empty($param['start_date']))
        {
            $obj = new stdClass;
            $obj->end_date = $param['start_date'];
            TForm::sendData('form_event', $obj);
        }
    }

    public static function onChangeEndDate($param=NULL)
    {
        if (empty($param['end_hour']) AND empty($param['end_minute']) AND !empty($param['start_hour']))
        {
            $obj = new stdClass;
            $obj->end_hour = min($param['start_hour'],22) +1;
            $obj->end_minute = '0';
            TForm::sendData('form_event', $obj);
        }
    }
    
    public function onSave()
    {
        try
        {
            // open a transaction with database 'sample'
            TTransaction::open('sample');
            
            $this->form->validate(); // form validation
            
            // get the form data into an active record Entry
            $data = $this->form->getData();
            
            $object = new Vw_calendario;
            $object->id       = $data->id;
            $object->titulo   = $data->titulo;
            $object->dtinicio = $data->start_date . ' ' . str_pad($data->start_hour, 2, '0', STR_PAD_LEFT) . ':' . str_pad($data->start_minute, 2, '0', STR_PAD_LEFT) . ':00';
            $object->dtfim    = $data->end_date . ' ' . str_pad($data->end_hour, 2, '0', STR_PAD_LEFT) . ':' . str_pad($data->end_minute, 2, '0', STR_PAD_LEFT) . ':00';
            
            $object->store(); // stores the object
            
            $data->id = $object->id;
            $this->form->setData($data); // keep form data
            
            TTransaction::close(); // close the transaction
            $posAction = new TAction(array('Calendario', 'onReload'));
            $posAction->setParameter('view', $data->view);
            $posAction->setParameter('date', $data->start_date);
            
            // shows the success message
            new TMessage('info', TAdiantiCoreTranslator::translate('Record saved'), $posAction);
        }
        catch (Exception $e) // in case of exception
        {
            // shows the exception error message
            new TMessage('error', $e->getMessage());
            
            $this->form->setData( $this->form->getData() ); // keep form data
            
            // undo all pending operations
            TTransaction::rollback();
        }
    }

    public function onEdit($param)
    {
        try
        {
            if (isset($param['key']))
            {
                // get the parameter $key
                $key=$param['key'];
                
                // open a transaction with database 'sample'
                TTransaction::open('sample');
                
                // instantiates object Vw_calendario
                $object = new Vw_calendario($key);
                
                $data = new stdClass;
                $data->id            = $object->id;
                $data->titulo        = $object->titulo;
                $data->start_date    = substr($object->dtinicio,0,10);
                $data->start_hour    = substr($object->dtinicio,11,2);
                $data->start_minute  = substr($object->dtinicio,14,2);
                $data->end_date      = substr($object->dtfim,0,10);
                $data->end_hour      = substr($object->dtfim,11,2);
                $data->end_minute    = substr($object->dtfim,14,2);
                $data->view          = $param['view'];
                
                // fill the form with the active record data
                $this->form->setData($data);
                
                // close the transaction
                TTransaction::close();
            }
            else
            {
                $this->form->clear();
            }
        }
        catch (Exception $e) // in case of exception
        {
            // shows the exception error message
            new TMessage('error', $e->getMessage());
            
            // undo all pending operations
            TTransaction::rollback();
        }
    }
    
    public static function onDelete($param)
    {
        // define the delete action
        $action = new TAction(array('CalendarEventForm', 'Delete'));
        $action->setParameters($param); // pass the key parameter ahead
        
        // shows a dialog to the user
        new TQuestion(AdiantiCoreTranslator::translate('Do you really want to delete ?'), $action);
    }
    
    public static function Delete($param)
    {
        try
        {
            // get the parameter $key
            $key = $param['id'];
            // open a transaction with database
            TTransaction::open('sample');
            
            // instantiates object
            $object = new Vw_calendario($key, FALSE);
            
            // deletes the object from the database
            $object->delete();
            
            // close the transaction
            TTransaction::close();
            
            $posAction = new TAction(array('Calendario', 'onReload'));
            $posAction->setParameter('view', $param['view']);
            $posAction->setParameter('date', $param['start_date']);
            
            // shows the success message
            new TMessage('info', AdiantiCoreTranslator::translate('Record deleted'), $posAction);
        }
        catch (Exception $e) // in case of exception
        {
            // shows the exception error message
            new TMessage('error', $e->getMessage());
            // undo all pending operations
            TTransaction::rollback();
        }
    }
    
    public function onStartEdit($param)
    {
        $this->form->clear();
        $data = new stdClass;
        $data->view = $param['view']; // calendar view
        
        if ($param['date'])
        {
            if (strlen($param['date']) == 10)
            {
                $data->start_date = $param['date'];
                $data->end_date = $param['date'];
            }
            if (strlen($param['date']) == 19)
            {
                $data->start_date   = substr($param['date'],0,10);
                $data->start_hour   = substr($param['date'],11,2);
                $data->start_minute = substr($param['date'],14,2);
                
                $data->end_date   = substr($param['date'],0,10);
                $data->end_hour   = substr($param['date'],11,2) +1;
                $data->end_minute = substr($param['date'],14,2);
            }
            $this->form->setData( $data );
        }
    }
    
    public static function onUpdateEvent($param)
    {
        try
        {
            if (isset($param['id']))
            {
                // get the parameter $key
                $key=$param['id'];
                
                // open a transaction with database 'sample'
                TTransaction::open('sample');
                
                // instantiates object CalendarEvent
                $object = new Vw_calendario($key);
                $object->dtinicio   = str_replace('T', ' ', $param['dtinicio']);
                $object->dtinicio   = str_replace('T', ' ', $param['dtfim']);
                $object->store();
                                
                // close the transaction
                TTransaction::close();
            }
        }
        catch (Exception $e) // in case of exception
        {
            new TMessage('error', $e->getMessage());
            TTransaction::rollback();
        }
    }
}
