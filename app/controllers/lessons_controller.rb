class LessonsController < ApplicationController
before_action :authenticate_user!
before_action :require_authorized_for_current_lesson

    def show 
	end 

	private 

	  def require_authorized_for_current_lesson
    if current_lesson.section.course.user != current_user
     redirect_to course_path, alert: 'Please enroll to see this content'
    end
  end
	
	helper_method :current_lesson
	def current_lesson
		@current_lesson ||= Lesson.find(params[:id])
	end
end

