class TaskTemplatesController < TasksController
#this actions defined in TasksController but unused in TasksTemplatesController
#they never called, but if some code call one of them, we need to know
#TODO: all this actions must be changed in production
  CUSTOM_ERROR_MESSAGE="tasks_tempaltes don't have this action, only tasks have "
  def  auto_complete_for_resource_name
    raise Exception, CUSTOM_ERROR_MESSAGE
  end
  def resource
    raise Exception, CUSTOM_ERROR_MESSAGE
  end
  def dependency
    raise Exception, CUSTOM_ERROR_MESSAGE
  end
  def ajax_restore
    raise Exception, CUSTOM_ERROR_MESSAGE
  end
  def ajax_check
    raise Exception, CUSTOM_ERROR_MESSAGE
  end
  def updatelog
    raise Exception, CUSTOM_ERROR_MESSAGE
  end
  def update_sheet_info
     raise Exception, CUSTOM_ERROR_MESSAGE
  end
  def update_tasks
    raise Exception, CUSTOM_ERROR_MESSAGE
  end
  def update_work_log
    raise Exception, CUSTOM_ERROR_MESSAGE
  end
  # don't track unread status for templates
  def set_unread
    render :text => "", :layout => false
  end
protected
####  This methods inherited from TasksController.
####  They modifies behavior of TasksController actions: new, create, edit, update etc.
####  Please see design pattern Template Method.
  def current_company_task_new
    task=Template.new
    task.company=current_user.company
    return task
  end
  def current_company_task_find_by_task_num(id)
    Template.find(:first, :conditions=>{ :task_num=>id,:company_id=>current_user.company_id})
  end
  def current_company_task_find(id)
    Template.find(:first, :conditions=>{ :company_id=>current_user.company_id})
  end
  def controlled_model
    Template
  end
  def big_fat_controller_method
    #must be empty templates don't use all this stuff
  end
  def create_worklogs_for_tasks_create
    #must be empty templates not have worklogs
  end
end
