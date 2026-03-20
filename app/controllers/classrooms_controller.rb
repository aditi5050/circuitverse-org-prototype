class ClassroomsController < ApplicationController
  def create
    @classroom = Classroom.new(classroom_params)

    authorize @classroom   # 🔥 THIS IS RBAC

    if @classroom.save
      render plain: "Created"
    else
      render plain: "Failed"
    end
  end

  private

  def classroom_params
    params.require(:classroom).permit(:name, :group_id)
  end
end