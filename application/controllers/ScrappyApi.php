<?php
require_once(APPPATH.'third_party/rest_server/libraries/REST_Controller.php');
 
class ScrappyApi extends REST_Controller {
 
    function user_get()
    {
        $data = array('returned: '. $this->get('id'));
        $this->response($data);
    }
     
    function user_post()
    {       
        $data = array('returned: '. $this->post('phone') . "POST action");
        $this->response($data);
    }
 
    function user_put()
    {       
        $data = array('returned: '. $this->put('id') . "PUT action");
        $this->response($data);
    }
 
    function user_delete()
    {
        $data = array('returned: '. $this->delete('id'));
        $this->response($data);
    }
}