module ApplicationHelper
  def active_menu path 
    p path
    if request.path == path
      return 'border-blue-600 text-blue-600 active dark:text-blue-500 dark:border-blue-500'
    else
      return 'border-transparent hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300';
    end

  end
end
