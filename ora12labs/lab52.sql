
Create or replace procedure sa_dequeue is
    Dequeue_options		dbms_aq.dequeue_options_t;
    Message_properties		dbms_aq.message_properties_t ;
    Message 			ALERT_TYPE ;
    Message_handle      		RAW(16);
Begin
    Dequeue_options.consumer_name := 'ALERT_USR1';
    /* Never wait */
    Dequeue_options.wait  := DBMS_AQ.NO_WAIT;
   /* Always reset the position to the beginning of the AQ */
    Dequeue_options.navigation := DBMS_AQ.FIRST_MESSAGE;
   /* remove the message when done */
    Dequeue_options.dequeue_mode  := DBMS_AQ.REMOVE;
    DBMS_AQ.DEQUEUE(
	  Queue_name   	=> 	'SYS.ALERT_QUE',
	  Dequeue_options 	=>	dequeue_options,
	  Message_properties	=>	message_properties,  
	  Payload		=>	message,
	  Msgid		=>	message_handle) ;
    DBMS_OUTPUT.PUT_LINE('Alert message dequeued:');
    DBMS_OUTPUT.PUT_LINE('  Timestamp:            ' ||
					       Message.timestamp_originating);
    DBMS_OUTPUT.PUT_LINE('  Suggested action: '||
       Dbms_server_alert.expand_message(userenv('LANGUAGE'),
					Message.suggested_action_msg_id,
					message.reason_argument_1,
					message.reason_argument_2,
					message.reason_argument_3,
					message.reason_argument_4,
					message.reason_argument_5));
   DBMS_OUTPUT.PUT_LINE('  Error Instance id: ' ||
     Message.error_instance_id);
   DBMS_OUTPUT.PUT_LINE('  Advisor Name:      ' || message.advisor_name);
   DBMS_OUTPUT.PUT_LINE('  Scope                    ' || message.scope);
   End;


/
